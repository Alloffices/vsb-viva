# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    if user.super_admin? && !user.unable_to_destroy
      can :manage, Center
      can :manage, CenterAdministrator
      can :manage, CenterDoctor
      can :manage, LocationDescription
      can :manage, CenterEvent
      can :manage, CenterInsurance
      can :manage, CenterSpeciality
      can :manage, Appointment
      can :manage, Contact
      can :manage, Tour
      can :manage, MeetPhysician
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
      can :manage, User
      can :read, ActiveAdmin::Page, :name => "Dashboard"
      can :read, User, role: User.roles['SuperAdmin']
      can [:read, :create, :update, :destroy], User, role: User.roles['Manager']
    elsif user.super_admin? && user.unable_to_destroy
      can :manage, Center
      can :manage, CenterAdministrator
      can :manage, CenterDoctor
      can :manage, LocationDescription
      can :manage, CenterEvent
      can :manage, CenterInsurance
      can :manage, CenterSpeciality
      can :manage, Appointment
      can :manage, Contact
      can :manage, Tour
      can :manage, MeetPhysician
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
      can :manage, User
      can :read, ActiveAdmin::Page, :name => "Dashboard"
      cannot :destroy, User, id: user.id
    elsif user.manager?
      can :manage, Center
      can :manage, CenterAdministrator
      can :manage, CenterDoctor
      can :manage, LocationDescription
      can :manage, CenterEvent
      can :manage, CenterInsurance
      can :manage, CenterSpeciality
      can :manage, Appointment
      can :manage, Contact
      can :manage, MeetPhysician
      can :manage, Tour
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
      can :read, ActiveAdmin::Page, :name => "Dashboard"
      can :read, User
    elsif user.event_admin?
      can [:read, :create, :update, :destroy], CenterEvent, admin_id: user.id
      can :read, CenterEvent
      can :read, ActiveAdmin::Page, :name => "Dashboard"
    elsif user.event_creator?
      can :read, ActiveAdmin::Page, :name => "Dashboard"
      can [:create, :show], CenterEvent
      can :read, CenterEvent, created_by_id: user.id
      can :update, CenterEvent, created_by_id: user.id
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
