FactoryGirl.define do
  factory :room do
    name { Faker::Name.title }
  end
end
