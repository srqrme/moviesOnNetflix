# CLI Controller
require 'pry'

class MoviesOnNetflix::CLI

  def start
    puts "----------------------------------------------------------------------------"
    puts "Hello and Welcome to The Best of Netflix:".center(75)
    puts "A Guide to the best Netflix movies according to Rotten Tomatoes!".center(75)
    puts "----------------------------------------------------------------------------"
    menu
    select
    run
  end

  def menu
    puts "How can I help you today?".center(65)
    puts ""
    puts "Enter '1' to see Rotten Tomatoes' current list of the best movies on Netflix."
    puts "Enter '2' to leave The Best of Netflix"
    puts "--------------------------------------------------------------------------------"
  end

  def select
    input = gets.strip.to_i
    case input
    when 1
      puts "--------------------------------------------------------------------------------"
      puts "Here are the top movies to watch on Netflix right now, listed in rank order:"
      puts "--------------------------------------------------------------------------------"
      list_movies
    when 2
      quit
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
    puts "--------------------------------------------------------------------------------"
    puts "Please enter the rank number of a movie you'd like more info on"
    input = gets.strip.to_i
    movie_object = MoviesOnNetflix::Movie.find(input)
    MoviesOnNetflix::Scraper.scrape_movie_profile(movie_object)
      puts ""
      puts "--------------- #{movie_object.title} ---------------"
      puts "Audience Score: #{movie_object.audience_score} liked it."
      puts "Film Rating: #{movie_object.rating}"
      puts "Genre:  #{movie_object.genre}"
      puts "Director: #{movie_object.director}"
      puts "Run Time: #{movie_object.runtime}"
      puts "--------------- Synopsis: ---------------"
      puts "#{movie_object.synopsis}"
    view_another
  end

  def quit
    puts ""
    puts "Thank you for using moviesOnNetflix, have a nice day!"
    puts ""
    exit
  end

  def view_another
    puts "--------------------------------------------------------------------------------"
    puts "Would you like to view the details of another movie? Y/N?"
    input = gets.chomp

    case input
    when "y" || "Y"
      run
    when "n" || "N"
      quit
    else
      puts "I'm not sure I understand."
      menu
    end
  end
end
