class PhysiciansController < ApplicationController
  def index
  end
  def show
    @doctor = Doctor.find_by_name(params[:name])
  end
  def search
    if params[:lat] and params[:long]
      @centers = Center.near([params[:lat], params[:long]], 50, units: :mi)
      @doctors = Doctor.joins(:center_doctors).where('center_doctors.center_id = ?', @centers.map{|c| c.id})
    else
      doctor_search = {}
      doctor_search['name_or_centers_city_or_centers_county_or_centers_state_or_centers_zip_code_cont'] = params["search"]
      @doctors = Doctor.joins(:centers).ransack(doctor_search).result(distinct: false).uniq
    end
  end
end
