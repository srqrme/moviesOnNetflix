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
      movie_url = row.css("a.article_movie_poster").attribute("href").value
      movie_attributes = {:title => title, :rank => rank, :movie_url => movie_url}
      movies << movie_attributes
    end
    movies
  end

  def self.scrape_movie_profile(movie_object)
    profile_doc = Nokogiri::HTML(open(movie_object.movie_url))
    scraped_movie = []
    movie_info = profile_doc.css("#mainColumn") #.collect do |key, value|
    # Assign values to movie_object attributes
      movie_object.audience_score = movie_info.css(".meter-value .superPageFontColor").text
      movie_object.synopsis = movie_info.css("#movieSynopsis").text.strip
      movie_object.rating = movie_info.css("ul li:first-child meta-value").text.strip
      movie_object.genre = movie_info.css("ul li[2] .meta-value a").first.text.chomp.strip
      movie_object.director = movie_info.css("ul li[3] .meta-value a").text.strip
      movie_object.cast = movie_info.css(".cast-item.media.inlineBlock .media-body a span").text.chomp
  end

  def self.details(movie_object)
    if movie_object.director == "" || movie_object.rating == "" || movie_object.cast == ""
      puts "#{movie_object.title.upcase}"
      puts ""
      puts "Audience Score: #{movie_object.audience_score} liked it."
      puts "Film Rating: N/A"
      puts "Genre:  #{movie_object.genre}"
      puts "Director: N/A"
      puts "Starring: N/A"
      puts ""
      puts ".................... Synopsis ...................."
      puts ""
      puts "#{movie_object.synopsis}"
    else
      puts "Starring: N/A"
      puts ".................... #{movie_object.title.upcase} ...................."
      puts ""
      puts "Audience Score: #{movie_object.audience_score} liked it."
      puts "Film Rating: #{movie_object.rating}"
      puts "Genre:  #{movie_object.genre}"
      puts "Director: #{movie_object.director}"
      puts "Starring: #{movie_object.cast}"
      puts ""
      puts ".................... Synopsis ...................."
      puts ""
      puts "#{movie_object.synopsis}"
    end
  end
end
