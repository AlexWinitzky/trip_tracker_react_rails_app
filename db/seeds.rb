10.times do 
  trip = Trip.create(
    name: Faker::HitchhikersGuideToTheGalaxy.planet
    )

  15.times do
    @location = trip.locations.create(
      name: Faker::HitchhikersGuideToTheGalaxy.location
    )

    @location.create_address(
      location_id: @location,
      street: Faker::Address.street_address,
      city: Faker::GameOfThrones.city,
      zip: Faker::Address.zip_code
    )
  end
end

puts 'seeded, yo'