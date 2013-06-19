FactoryGirl.define do
  factory :user do
    email
    password
    full_name { Faker::Name.name }
  end
end
