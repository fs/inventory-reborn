FactoryGirl.define do
  factory :location do
    name { Faker::Name.title }
  end
end
