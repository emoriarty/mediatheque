class VideosController < ApplicationController
  include MultiMedia

  def index
    @videos = Video.all
    respond_to do |format|
      format.html
      format.xml{ render :xml => @videos }
      format.json{ render :json => @videos }
    end
  end
  
  def show
    @video = Video.find params[:id].to_i
    
    respond_to do |format|
      format.html
      format.xml{ render :xml => @video }
      format.json{ render :json => @video }
    end
  end
  
end
