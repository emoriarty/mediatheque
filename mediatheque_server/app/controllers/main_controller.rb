class MainController < ApplicationController
  skip_filter :signed_in?
  
  before_filter :mobile_agent?
  
  def index
    logger.debug "ROOT"
    logger.debug "current_user: #{current_user}"
    respond_to do |format|
      format.html
    end
  end
end
