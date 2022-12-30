class ApplicationController < ActionController::Base
  helper_method :logged_in?

  def logged_in?
    current_user.present?
  end

  def current_user
    @_current_user ||= User.find_by(id: session[:user_id])
  end
end
