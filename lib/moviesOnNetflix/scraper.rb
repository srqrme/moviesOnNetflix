require 'nokogiri'
require 'open-uri'
require 'pry'

class MoviesOnNetflix::Scraper

  def self.scrape_movie_index
    movie_doc = Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/best-netflix-movies-to-watch-right-now/"))
    movies = []
    movie_doc.css(".row.countdown-item").each do |row|
      title = row.css(".article_movie_title h2 a").text
      rank = row.css(".countdown-index").text
      consensus = row.css(".info.critics-consensus").text.split("Critics Consensus:").join
      movie_url = row.css(".article_movie_title div h2 a").attribute("href").value
      movie_attributes = {:title => title, :rank => rank, :consensus => consensus, :movie_url => movie_url}
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
end
