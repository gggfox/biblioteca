User.create!(name:                  "Example User",
             email:                 "example@gmail.com",
             password:              "footbars",
             password_confirmation: "footbars",
             admin: true,
             author: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
30.times do
  title   =  Faker::Lorem.sentence(word_count: 2)
  author  =  Faker::Lorem.sentence(word_count: 2)
  content =  Faker::Lorem.sentence(word_count: 50)

  users.each { |user| user.reviews.create!(title:   title, 
                                           author:  author,
                                           content: content) }
end