# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    can :manage, Center
    can :manage, CenterAdministrator
    can :manage, CenterDoctor
    can :manage, LocationDescription
    can :manage, User
    can :manage, CenterEvent
    can :manage, CenterInsurance
    can :manage, CenterSpeciality
    can :manage, Doctor
    can :manage, DoctorCategory
    can :manage, DoctorType
    can :manage, Insurance
    can :manage, PhysicianType
    can :manage, Region
    can :manage, Service
    can :manage, Speciality
    cannot :destroy, User, unable_to_destroy: true
    cannot :destroy, User, id: user.id
  if user.super_admin? && !user.unable_to_destroy
      can :read, User, role: User.roles['SuperAdmin']
      can [:read, :create, :update, :destroy], User, role: User.roles['Manager']
      can :read, ActiveAdmin::Page, :name => "Dashboard"
    elsif user.super_admin? && user.unable_to_destroy
      can :manage, User
      cannot :destroy, User, id: user.id
      can :read, ActiveAdmin::Page, :name => "Dashboard"
    elsif user.manager?
      can :read, User
      can :read, ActiveAdmin::Page, :name => "Dashboard"
    end

    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
