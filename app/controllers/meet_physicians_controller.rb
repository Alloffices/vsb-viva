class MeetPhysiciansController < ApplicationController

  def create
    meet_physicians = MeetPhysician.new(appointment_params)
    if meet_physicians.save
      flash[:success] = "Meet Physician Request Submitted successfully"
      redirect_back(fallback_location:"/")
    else
      flash[:danger] = "unable to create request please try again !!"
      redirect_back(fallback_location:"/")
    end
  end



  private

  def appointment_params
    params.require(:meet_physician).permit(:your_name, :email, :phone, :date, :time, :notes, :contacted_via)
  end
end
