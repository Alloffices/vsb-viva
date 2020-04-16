class HomeController < ApplicationController
  def index
  end

  def set_location
    session[:lat] = params[:lat]
    session[:long] = params[:long]
  end
end
