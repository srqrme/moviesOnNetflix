# CLI Controller
require 'pry'

class MoviesOnNetflix::CLI

  def start
    puts "......................................................................................................................................."
    puts ""
    puts "Hello and Welcome to The Best of Netflix:"
    puts "A Guide to the best Netflix movies according to Rotten Tomatoes!"
    puts ""
    puts "......................................................................................................................................."
    sleep(01)
    menu
  end

  def menu

    puts ""
    puts "Please enter a number from the following options:"
    puts ""
    puts "Enter '1' if you'd like to see Rotten Tomatoes' current list of the best movies on Netflix."
    puts "Enter '2' to leave The Best of Netflix"
    puts ""
    puts "........................................................................................................................................."

    input = gets.strip.to_i

    case input
    when 1
      puts "......................................................................................................................................."
      puts ""
      puts "Here are the top movies to watch on Netflix right now, listed in rank order:"
      puts ""
      puts "......................................................................................................................................."
      sleep(01)
      list_movies
      puts ""
      run
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
    puts "......................................................................................................................................."
    puts ""
    puts "Please enter the rank number of a movie you'd like more information on:"
    puts ""
    puts "......................................................................................................................................."
    puts ""

    input = gets.strip.to_i

    puts "......................................................................................................................................."

    movie_object = MoviesOnNetflix::Movie.find(input)
    MoviesOnNetflix::Scraper.scrape_movie_profile(movie_object)
      puts "  #{movie_object.rank}  #{movie_object.title.upcase}"
      puts "......................................................................................................................................."
      puts ""
      puts "Audience Score: #{movie_object.audience_score} liked it."
      puts "Film Rating: #{movie_object.rating}"
      puts "Genre:  #{movie_object.genre}"
      puts "Director: #{movie_object.director}"
      puts "Run Time: #{movie_object.runtime}"
      puts ""
      puts ".................... Synopsis ...................."
      puts ""
      puts "#{movie_object.synopsis}"
      puts ""
    view_another
  end

  def view_another

    puts "......................................................................................................................................."
    puts ""
    puts "Would you like to see the details of another movie? Y/N?"
    puts ""
    puts "......................................................................................................................................."

    input = gets.chomp

    case input
    when "y" || "Y"
      run
    when "n" || "N"
      quit
    else
      puts "I'm not sure I understand."
      view_another
    end
  end

  def quit
    puts ""
    puts "Thank you for using moviesOnNetflix, have a nice day!"
    puts ""
    exit
  end

  def choose_movie
    puts "......................................................................................................................................."
    puts ""
    puts "Please enter the rank number of a movie you'd like more information on:"
    puts ""
    puts "......................................................................................................................................."
    puts ""
  end
end
