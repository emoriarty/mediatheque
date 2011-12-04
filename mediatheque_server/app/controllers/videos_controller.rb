class VideosController < ApplicationController
  
  def index
    @videos = Video.page(params[:page] || 1)
  end

  def new
    @video = Video.new
  end

  def create
    Video.create! params[:video]
    redirect_to movies_path
  end

end
