class CentersController < ApplicationController
  def show
  	@center = Center.find_by_name(params[:name])
  end
end
