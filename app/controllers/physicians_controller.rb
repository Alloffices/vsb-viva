class PhysiciansController < ApplicationController
  def index
  end
  def show 
    @doctor = Doctor.find_by_name(params[:name])
  end 
  def search
    doctor_search = {}
    doctor_search['name_or_centers_city_or_centers_county_or_centers_state_or_centers_zip_code_cont'] = params["search"]
    @doctors = Doctor.joins(:centers).ransack(doctor_search).result(distinct: false).uniq
  end
end
