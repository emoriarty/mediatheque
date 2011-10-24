module MultiMedia
  class Video < Media
    validates :duration, :presence => true
    
    def retrieve_info
      VideoServiceInfo.retrieve_info :t => title
    end
    
    def self.info(title)
      VideoServiceInfo.retrieve_info :t => title
    end
  end
end
