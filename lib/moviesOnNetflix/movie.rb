require 'pry'

class MoviesOnNetflix::Movie

  attr_accessor :title, :rank, :movie_url, :critic_review

  @@all = []

  def initialize(rank=nil, title=nil, movie_url=nil)
    @title = title
    @rank = rank
    @movie_url = movie_url
    @@all << self
  end

  def self.create_from_collection
    MoviesOnNetflix::Scraper.scrape_netflixMovies.each do |movie|
      self.new(movie[:rank], movie[:title])
    end
  end


  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  def critic_review
    @critic_review ||= doc.css("span.subtle.superPageFontColor").text
  end

  def doc
    @doc ||= Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/best-netflix-movies-to-watch-right-now/"))
  end
end
