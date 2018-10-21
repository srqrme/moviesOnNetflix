class MoviesOnNetflix::Movie

  attr_accessor :title, :rank, :movie_url, :synopsis, :rating, :genre

  @@all = []

  def self.create_from_collection
    MoviesOnNetflix::Scraper.scrape_movie_index.each do |movie|
      self.new(movie[:rank], movie[:title], movie[:movie_url])
    end
  end

  def initialize(rank= nil, title=nil, movie_url=nil)
    @title = title
    @rank = rank
    @movie_url = movie_url
    @@all << self
  end


  def self.all
    @@all
  end

  def self.find(i)
    self.all[i]
  end
end
