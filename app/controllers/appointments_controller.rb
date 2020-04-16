class AppointmentsController < ApplicationController

  def create
    appointment = Appointment.new(appointment_params)
    if appointment.save
      flash[:success] = "appointment create successfully"
      redirect_back(fallback_location:"/")
    else
      flash[:danger] = "unable to create appointment please try again"
      redirect_back(fallback_location:"/")
    end
  end



  private

  def appointment_params
    params.require(:appointment).permit(:your_name, :email, :phone, :date, :time, :notes, :contacted_via)
  end
end
