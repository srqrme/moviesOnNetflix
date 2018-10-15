require 'nokogiri'
require 'open-uri'
require 'pry'

class MoviesOnNetflix::Scraper

  def self.scrape_netflixMovies
    m = Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/best-netflix-movies-to-watch-right-now/"))
    movies = []
    m.css("div.row.countdown-item").each do |movie|
      title = movie.css("div.article_movie_title h2 a").text
      rank = movie.css("div.col-sm-4.col-full-xs div.countdown-index").text
      movie_attributes = {:rank => rank, :title => title}
      movies << movie_attributes
    end
    movies
  end
end
