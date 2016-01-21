class ApplicationController < ActionController::API
  def current_user
    @current_user ||= Band.find(session[:band_id]) if session[:band_id]
  end

  def authorize
    unless current_user
      return false
    end
  end

end
