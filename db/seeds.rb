require 'faker'

puts 'Creating data'

10.times do
  movie = Movie.create(
    title: Faker::Movie.quote,
    description: Faker::Movies::VForVendetta.quote,
    rating: rand(5) + 1,
    duration: (rand(7200) / 3600.00).round(2),
    price: rand(100),
    status: rand(3),
    progress: rand(100)
  )
  serie = Serie.create(
    title: Faker::Movie.quote,
    description: Faker::Movies::VForVendetta.quote,
    rating: rand(5) + 1,
    price: rand(100),
    status: rand(3)
  )

  5.times do
    Episode.create(
      title: Faker::Movie.quote,
      description: Faker::Movies::VForVendetta.quote,
      duration: (rand(7200) / 3600.00).round(2),
      serie_id: serie.id,
      progress: rand(100)
    )
  end

  movie.rentals.create(
    paid_price: rand(400) + 1
  )

  serie.rentals.create(
    paid_price: rand(400) + 1
  )
end

puts 'Seed data created'
