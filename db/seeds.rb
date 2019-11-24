User.create!(name:  "Example User",
  email: "example@example.com",
  password:              "password",
  password_confirmation: "password",
  admin: true,
  activated: true,
  activated_at: Time.zone.now)

99.times do |n|
name  = Faker::Name.name
email = "example-#{n+1}@example.com"
password = "password"
User.create!(name:  name,
    email: email,
    password:              password,
    password_confirmation: password,
    activated: true,
    activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
50.times do
  title = Faker::Lorem.words(1).join('')
  date = Faker::Date.between(Date.today, 3.months.from_now)
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.events.create!(title: title, date: date, 
                                          content: content) }
end