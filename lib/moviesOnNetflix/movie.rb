require 'pry'
class MoviesOnNetflix::Movie

  attr_accessor :title, :rank, :movie_url, :synopsis, :rating, :genre, :director, :cast, :audience_score

  @@all = []

  def initialize(attributes)
    attributes.each do |key, value|
      self.send(("#{key}="), value)
    end
    @@all << self
  end

  def self.create_from_collection
    MoviesOnNetflix::Scraper.scrape_movie_index.each do |movie|
      self.new(movie)
    end
  end

  def self.all
    @@all
  end

  def self.find(i)
    self.all[i-1]
  end
end
