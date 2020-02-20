class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?, :require_user

  def current_user
    @_current_user ||= session[:current_user_id] && User.find_by(id: session[:current_user_id])
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "you must be logged in to perform that action"
      redirect_to root_path
    end
  end

end
