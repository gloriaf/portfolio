FactoryGirl.define do
#  Crea un usuario predefinido  
#  factory :user do
#    name     "Maria Gloria Fernandez"
#    email    "mgfernandez@pabilos.com"
#    password "galapaga"
#    password_confirmation "galapaga"
#  end

# Crea usuarios genericos
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "foobar"
    password_confirmation "foobar"
    
    factory :admin do
      admin true  
    end
    factory :itprof do
      admin true  
    end
  end
  
#  crea microposts
  factory :micropost do
    content "Lorem ipsum"
    user
  end

  #  crea experiences
  factory :experience do
   sequence(:name) { |n| "Ruby Project #{n}" }
   year 2012
   user
  end
  
end