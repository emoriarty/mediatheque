class MainController < ApplicationController
  layout 'media'

  skip_filter :signed_in?
  
  def index
    logger.debug "ROOT"
    logger.debug "current_user: #{current_user}"
  end
end
