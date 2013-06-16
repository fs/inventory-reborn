FactoryGirl.define do
  factory :user do
    email
    password
    full_name { Faker::Name.name }

    trait :with_roles do
      roles { [FactoryGirl.build(:role)] }
    end

    trait :admin do
      roles { [Role.admin] }
    end
  end
end
