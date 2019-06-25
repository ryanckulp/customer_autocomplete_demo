# creates dummy customer records for autocomplete testing
1000.times do |_|
  Customer.create!(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    avatar_url: "https://api.adorable.io/avatars/#{rand(1..1000)}"
  )
end
