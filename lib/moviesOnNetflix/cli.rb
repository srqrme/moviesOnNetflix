# CLI Controller
require 'pry'

class MoviesOnNetflix::CLI

  #Begins the CLI with a greeting, then runs the next method: menu
  def start
    # puts "......................................................................................................................................."
    puts ""
    puts "Hello and Welcome to The Best of Netflix:"
    puts "A Guide to the best Netflix movies according to Rotten Tomatoes!"
    puts ""
    menu
  end

  #Asks the user what they would like to do, the user then types in a number from the selections
  def menu
    puts ""
    puts "Please enter a number from the following options:"
    puts ""
    puts "Enter '1' if you'd like to see Rotten Tomatoes' current list of the best movies on Netflix."
    puts "Enter '2' to leave The Best of Netflix"
    puts ""
    puts ""

    #Gets the user's menu selection as a string, then converts it to an integer
    input = gets.strip.to_i

    #If user selects 1, #list_movies is executed. If user selects 2, #quit is executed. If any other entry, error message is executed and user is brought back to the beginning of the #menu.
    if input == 1
    #case input
    #when 1
      puts ""
      puts "Here are the top movies to watch on Netflix right now, listed in rank order:"
      puts ""
      list_movies
      puts ""
      run
    elsif input == 2
    #when 2
      quit
    else
      puts "I'm not sure I understand."
      menu
    end
  end

  def list_movies
    #Calls and executes the Movie class method, #create_from_collection.
    MoviesOnNetflix::Movie.create_from_collection
    #Instantiates each
    MoviesOnNetflix::Movie.all.each do |movie|
      puts "#{movie.rank}   #{movie.title}"
    end
  end

  def run
    puts ""
    puts ""
    puts "Please enter the rank number of a movie you'd like more information on:"
    puts ""
    puts ""
    puts ""

    input = gets.strip.to_i

    puts ""

    movie_object = MoviesOnNetflix::Movie.find(input)

    MoviesOnNetflix::Scraper.scrape_movie_profile(movie_object)

    MoviesOnNetflix::Scraper.details(movie_object)

    view_another
  end

  def view_another

    puts ""
    puts ""
    puts "Would you like to see the details of another movie? Y/N?"
    puts ""
    puts ""

    input = gets.chomp

    if input == "y" || input == "Y"
      run
    elsif input == "n" || input == "N"
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
end
