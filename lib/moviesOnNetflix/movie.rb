class MoviesOnNetflix::MoviesOnNetflix
  attr_accessor :title, :rank, :genre, :release_year, :rated, :director, :actors, :runtime :synopsis, :consensus, :tomato_rating, :audience_score

  @@all = []

  def self.all
    puts "Movie Title, Director, Actors"
  end

  def self.made_movie(m)
    self.new(
      m.css(“div.article_movie_title h2 a”).text,
      m.css(“div.col-sm-4.col-full-xs div.countdown-index”).text,
      m.css(“div h2 span.subtle.start-year”).text,
      m.css(“div h2 span.tMeterScore”).text
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
