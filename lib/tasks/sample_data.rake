namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Maria Gloria Fernandez",
                 email: "mgfernandez@pabilos.com",
                 password: "palabraclave",
                 password_confirmation: "palabraclave")
    admin.toggle!(:admin)
    admin.toggle!(:itprof)
  
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@pabilos.com"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    
    users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end

    users = User.all(limit: 3)
    1.times do
      name = "Rails project"
      year = 2012
      users.each { |user| user.experiences.create!(name: name, year: year) }
    end
    
  end
    
end
