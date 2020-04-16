class ToursController < ApplicationController

  def create
   tour = Tour.new(tour_params)
    if tour.save
      flash[:success] = "Tour Request create successfully"
      redirect_back(fallback_location:"/")
    else
      flash[:danger] = "Unable to create tour request please try again"
      redirect_back(fallback_location:"/")
    end
  end

  private 
  def tour_params
    params.require(:tour).permit(:your_name, :email, :phone, :date, :time, :notes, :contacted_via)
  end
end
