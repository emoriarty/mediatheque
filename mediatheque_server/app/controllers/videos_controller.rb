class VideosController < ApplicationController
  
  def index
    @videos = current_user.videos.page(params[:page] || 1)

    respond_to do |format|
      format.html
    end
  end

  def new
    @video = Video.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @video = Video.find params[:id]

    respond_to do |format|
      format.html
    end
  end

  def create
    begin
      @video = Video.new params[:video].merge(:user_id => current_user)
      
      logger.debug "@video: #{@video.inspect}"
      
      unless @video.save
        logger.error "\n\nerror messages: #{@video.errors.full_messages.inspect}\n\n"
        flash[:error] = "The video can't be created"
      end  
    rescue Exception => e
      logger.error e.message
      flash[:error] = "There was an error"
    end
    
    respond_to do |format|
      format.html{ flash[:error] ? render('new') : redirect_to(videos_path)  }
    end
  end

end
