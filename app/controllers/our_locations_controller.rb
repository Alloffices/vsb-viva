class OurLocationsController < ApplicationController
  def index
  end

  def search
    search = {}
    search['name_or_address_1_or_address_2_or_city_or_county_or_latitude_or_longitude_or_state_or_zip_code_cont'] = params["search"]
    @centers = Center.ransack(search).result(distinct: false)
  end
end
