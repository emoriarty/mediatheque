module MultiMedia
  class Video < Media
    validates :duration, :presence => true
  end
end
