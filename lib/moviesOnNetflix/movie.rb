class MoviesOnNetflix::Movie

  attr_accessor :title, :rank

  @@all = []

  def create_from_collection(scrape_netflixMovies)
    scrape_netflixMovies.each do |movie|
      Movie.new(movie)
    end
  end

  def initialize(title=nil, rank=nil)
    @title = title
    @rank = rank
    @@all << self
  end

  def self.all
    @@all
  end
end
