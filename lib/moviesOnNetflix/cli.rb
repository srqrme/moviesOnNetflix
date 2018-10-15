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
    puts "2. How To"
    puts "3. Quit"
    input = gets.strip.to_i

    case input
      when 1
        list_movies
      when 2
        how_to
      when 3
        puts "Thank you for using moviesOnNetflix, have a nice day!"
        exit
      else
        puts "I'm not sure I understand."
        menu
    end
  end

  def how_to
    puts "How to use moviesOnNetflix:"
    puts "In the welcome page, enter 1 to list all movies. Each movie will be listed by rank according to Rotten Tomatoes Tomato Meter."
    puts "Enter 2 to go to this instructional page"
    puts "Enter 3 to quit moviesOnNetflix"
    puts "Would you like to go back to the welcome page?"
    input = gets.strip.downcase
    if input == "y"
      menu
    elsif input == "n"
      puts "Thank you for using moviesOnNetflix, have a nice day!"
    else
      puts "I'm not sure I understand what you want to do."
      menu
    end
  end
  def list_movies
    MoviesOnNetflix::Movie.create_from_collection
    MoviesOnNetflix::Movie.all.each do |movie|
      puts "Rank:    #{movie.rank}"
      puts "Title:   #{movie.title}"
    end
  end
end
