class ApplicationController < ActionController::Base

  def access_denied(exception)
    redirect_to root_path, :alert => exception.message
  end


  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_path
  end
end
