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

    flash[:error] = I18n.t("videos.messages.no_video") unless @video

    respond_to do |format|
      format.html{ redirect_to('index') unless flash[:error].nil? }
    end
  end

  def create
    begin
      @video = Video.new params[:video].merge(:user_id => current_user)
      
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

  def show
    @video = Video.find params[:id]
    
    flash[:error] = I18n.t("videos.messages.no_video") unless @video
    
    respond_to do |format|
      format.html{ redirect_to('index') unless flash[:error].nil? }
    end      
  end

  def destroy
    @video = Video.find params[:id]

    if @video
      if @video.destroy
        flash[:notice] = "#{I18n.t('videos.messages.destroyed').capitalize}: #{@video.title}"
      else
        flash[:error] = "#{I18n.t('videos.messages.cant_destroy').capitalize}: #{@video.title}"
      end
    else
      flash[:error] = I18n.t("videos.messages.no_video").capitalize
    end
     
    respond_to do |format|
      format.html{ redirect_to videos_path }
    end    
  end
end
