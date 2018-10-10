class MoviesOnNetflix::Scraper

  def get_page
    Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/best-netflix-movies-to-watch-right-now/"))
  end

  def scrape_movie_index
    self.get_page.css("div.row.countdown-item")
  end

  def make_movie
    scrape_movie_index.each do |m|
      MoviesOnNetflix::Movie.made_movie(m)
    end
  end
end
