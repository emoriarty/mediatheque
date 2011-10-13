class MultiMediaController < ApplicationController
  include MultiMedia

  def index
    @videos = Video.all
    respond_to do |format|
      format.html
      format.xml{ render :xml => @videos }
      format.json{ render :json => @videos }
    end
  end
end
