require 'pry'

class MoviesOnNetflix::Movie

  attr_accessor :title, :rank, :critic_review

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
