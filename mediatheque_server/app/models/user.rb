class User < ActiveRecord::Base
  has_many :videos
  
  def movies
    videos
  end
end
