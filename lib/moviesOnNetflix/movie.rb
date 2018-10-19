class MoviesOnNetflix::Movie

  attr_accessor :title, :rank, :movie_url, :synopsis

  @@all = []

  def self.create_from_collection
    MoviesOnNetflix::Scraper.scrape_movie_index.each do |movie|
      self.new(movie[:rank], movie[:title])
    end
  end



  def initialize(rank= nil, title=nil)
    @title = title
    @rank = rank
    @@all << self
  end


  def self.all
    @@all
  end

  def self.find(i)
    self.all[i-1]
  end
end
