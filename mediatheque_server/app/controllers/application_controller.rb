class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user, :signed_in?
  
  before_filter :signed_in?
  
  def current_user
    logger.debug "@user.nil?: #{@user.nil?}"
    logger.debug "session: #{session.inspect}"
    
    @user ||= User.find_by_salt(session[:user_salt])
    logger.debug "@user: #{@user.inspect}"
    @user
  end
  
  def signed_in?
    unless current_user
      flash[:notice] = "You're must be logged in"
      redirect_to root_path
    end
  end
end
