class MoviesOnNetflix::MoviesOnNetflix

  attr_accessor :title, :rank

  @@all = []

  def self.made_movie(m)
    self.new(
      m.css(“div.article_movie_title h2 a”).text,
      m.css(“.countdown-index”).text
      )
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
