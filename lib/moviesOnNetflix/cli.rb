# CLI Controller
require 'pry'

class MoviesOnNetflix::CLI

  def call
    puts "Hello and Welcome to Rotten Tomatoes Guide to the best Netflix movies by Tomatometer!"
    menu
  end

  def menu
    puts "Please enter a number from the following options"
    puts "1. List Movies"
    puts "2. Quit"
    input = gets.strip.to_i

    case input
    when 1
      puts "Best Netflix Movies To Watch Right Now, Listed By Rank:"
      make_movies
    when 2
      puts "Thank you for using moviesOnNetflix, have a nice day!"
      exit
    else
      puts "I'm not sure I understand."
      menu
    end
  end

  def make_movies
    movies_array = MoviesOnNetflix::Scraper.scrape_movie_index("https://editorial.rottentomatoes.com/guide/best-netflix-movies-to-watch-right-now")
    MoviesOnNetflix::Movie.create_from_collection(movies_array)
  end
end
