class OurLocationsController < ApplicationController
  def index
  end

  def search
    if params[:lat] and params[:long]
      session[:lat] = params[:lat] unless  session[:lat]
      session[:long] = params[:long] unless session[:long]
      @centers = Center.near([params[:lat], params[:long]], 50, units: :mi)
      @location = Geocoder.search([params[:lat],params[:long]])
    else
      search = {}
      search['name_or_address_1_or_address_2_or_city_or_county_or_latitude_or_longitude_or_state_or_zip_code_cont'] = params["search"]
      @centers = Center.ransack(search).result(distinct: true)
    end
  end
end
