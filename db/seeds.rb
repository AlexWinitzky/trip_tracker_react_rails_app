10.times do 
  trip = Trip.create(
    name: Faker::HitchhikersGuideToTheGalaxy.planet
    )

  15.times do
    @location = trip.locations.create(
      name: Faker::HitchhikersGuideToTheGalaxy.location
    )

    1.times do
      Address.create(
        location_id: @location,
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        zip: Faker::Address.zip_code
      )
    end
  end
end

puts 'seeded, yo'