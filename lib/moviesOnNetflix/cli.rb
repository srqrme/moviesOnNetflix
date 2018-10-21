# CLI Controller
require 'pry'

class MoviesOnNetflix::CLI

  def call
    puts "Hello and Welcome to Rotten Tomatoes Guide to the best Netflix movies by Tomatometer!"
    menu
    run
  end

  def menu
    puts "Please enter a number from the following options"
    puts "1. List Movies"
    puts "2. Quit"
    input = gets.strip.to_i

    case input
    when 1
      puts "Best Netflix Movies To Watch Right Now, Listed By Rank:"
      list_movies
    when 2
      puts "Thank you for using moviesOnNetflix, have a nice day!"
      exit
    else
      puts "I'm not sure I understand."
      menu
    end
  end

  def list_movies
    MoviesOnNetflix::Movie.create_from_collection
    MoviesOnNetflix::Movie.all.each do |movie|
      puts "#{movie.rank}   #{movie.title}"
    end
  end

  def run
    puts "Please select a movie you'd like more info on"
    input = gets.strip.to_i
    movie_object = MoviesOnNetflix::Movie.find(input)
    MoviesOnNetflix::Scraper.scrape_movie_profile(movie_object)
      puts "#{movie_object.title}"
      puts "#{movie_object.rating}"
      puts ""
      puts "#{movie_object.synopsis}"
  end
end
