require 'nokogiri'
require 'open-uri'
require 'pry'

class MoviesOnNetflix::Scraper
  BASE_PATH = "https://editorial.rottentomatoes.com/guide/best-netflix-movies-to-watch-right-now/"

  def self.scrape_movie_index
    movie_doc = Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/best-netflix-movies-to-watch-right-now/"))
    movies = []
    movie_doc.css(".row.countdown-item").each do |row|
      title = row.css(".article_movie_title h2 a").text
      rank = row.css(".countdown-index").text
      movie_url = row.css(".article_movie_title div h2 a").attribute("href").value
      movie_attributes = {:title => title, :rank => rank, :movie_url => movie_url}
      movies << movie_attributes
    end
    movies
  end
  #doc.css(".row.countdown-item").each do |row|
    #course = Course.new
    #course.title = row.css(".article_movie_title h2 a").text
    #course.rank = row.css(".countdown-index").text
    #course.consensus = row.css(".info.critics-consensus").text.split("Critics Consensus:").join
    #course.movie_url = row.css(".article_movie_title div h2 a").attribute("href").value
  #end
  def self.scrape_movie_profile(movie_object)
    profile_doc = Nokogiri::HTML(open(BASE_PATH + movie_object.movie_url))
    scraped_profiles = {}
    movie_info = profile_doc.css(".panel-body.content_body") #.collect do |key, value|
    # Assign values to movie_object attributes
    movie_object.synopsis = movie_info.css("#movieSynopsis").text      # movie_info.each do |key|
      #  if key.include?()
  end
end
