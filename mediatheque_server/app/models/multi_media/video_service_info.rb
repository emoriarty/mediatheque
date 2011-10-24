module MultiMedia
  class VideoServiceInfo < ServiceInfo
    self.site = "http://www.imdbapi.com/"
    
    #Params to pass in:
    # t => title
    # y => year
    # i => imdb id
    # r => JSON (default), XML 
    # plot => short, full (short or extended plot (short default))
    def self.retrieve_info(params)
      self.element_name = ""
      find :all, :params => params, :from => "/"
    end
  end
end