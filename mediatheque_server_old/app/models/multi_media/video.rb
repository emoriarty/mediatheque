require 'movie_searcher'

module MultiMedia
  class Video < Media
    include ImdbParty
    
    attr_accessor :title, :path, :file, :cover, :year, :plot, :director, :writer, :composer, :cast
    
    validates :duration, :presence => true
    
    def retrieve_info( name = nil )
      MovieSearcher.find_by_title name.nil? ? title : name
    end
    
    def update_info( movie )
      return if movie.nil?
      @movie = MovieSearcher.find_movie_by_id( movie.is_a?(Movie) ? movie.imdb_id : movie )
      @attr = {}
      @attr[:title] = @movie.title
      @attr[:year] = @movie.year
      @attr[:plot] = @movie.plot
      @attr[:director] = collect_names @movie.directors
      @attr[:writer] = collect_names @movie.writers
      @attr[:cast] = collect_names @movie.actors
      genre_list = collect_genres @movie.genres
      update @attr
    end
    
    private
    # this method get an array of ImdbParty::Person and returns a string of names
    def collect_names( persons )
      persons.map{ |person| person.name  }.join ", "
    end
    
    # this method get an array of string respresentings genre names and returns a string of genres
    def collect_genres( genres )
      genres.join ", "
    end
  end
end
