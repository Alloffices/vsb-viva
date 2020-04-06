class CenterEventMailer < ApplicationMailer

  def mail_to_admin
    @user = params[:user]
    @admin = params[:admin]
    @event = params[:event]
    mail(to: @user.email, subject: "Event Alert from #{@user.full_name.capitalize}")
  end


  def remind_to_admin
    @admin = params[:admin]
    @events = params[:events]
    mail(to: @admin.email, subject: "please check your pending events")
  end

end
