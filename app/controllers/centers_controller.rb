class CentersController < ApplicationController
  def show
  	@center = Center.find_by_name(params[:name])
  end

  def events
    @center = Center.find_by(id: params[:center_id])
    render json: {events: @center.json_events}
  end
end
