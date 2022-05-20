# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# require "faker"

# Movie.destroy_all

# 20.times do
#   movie = Movie.new(
#     title: Faker::Movie.title,
#     overview: Faker::Movie.quote,
#     poster_url: Faker::LoremFlickr.image(size: "500x500", search_terms: ['movie']),
#     rating: rand(1.0..10.0)
#   )
#   movie.save!
# end


url = 'https://tmdb.lewagon.com/movie/top_rated'
movies = JSON.parse(URI.open(url).read)

puts 'Destroying all movies'
Movie.destroy_all

puts 'Creating movies...'
movies["results"].each do |movie|
    Movie.create(
      title: movie["original_title"],
      rating: movie["vote_average"],
      overview: movie["overview"],
      poster_url: "https://image.tmdb.org/t/p/w500/#{movie['poster_path']}"
    )
end

puts 'All done'
