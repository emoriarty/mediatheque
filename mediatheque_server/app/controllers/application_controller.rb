class ApplicationController < ActionController::Base
  protect_from_forgery
  
  has_mobile_fu
  
  helper_method :current_user, :signed_in?
  
  before_filter :signed_in?, :set_locale
  
  def current_user
    logger.debug "@user_logged.nil?: #{@user_logged.nil?}"
    logger.debug "session: #{session.inspect}"
    
    @user_logged ||= User.find_by_salt(session[:user_salt])
    logger.debug "@user: #{@user_logged.inspect}"
    @user_logged
  end
  
  def signed_in?
    unless current_user
      flash[:notice] = "You're must be logged in"
      redirect_to root_path
    end
  end
  
  def mobile_agent?
    logger.debug "\n\n Mobile?"
    logger.debug request.user_agent
    logger.debug "\n\n"
    request.user_agent =~ /Mobile|webOS/
  end

  def set_locale
    I18n.locale = params[:locale] if params.include?('locale')
  end

end
