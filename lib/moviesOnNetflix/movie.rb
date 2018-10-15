require 'pry'

class MoviesOnNetflix::Movie

  attr_accessor :title, :rank

  @@all = []

  def self.create_from_collection
    MoviesOnNetflix::Scraper.scrape_netflixMovies.each do |movie|
      self.new(movie[:rank], movie[:title])
    end
  end

  def initialize(rank=nil, title=nil)
    @title = title
    @rank = rank
    @@all << self
  end

  def self.all
    @@all
  end
end
