FactoryGirl.define do
  factory :unit do
    unit_type 'Awesome Type'
    sequence :inv_id
    name { Faker::Name.title }
    description 'Awesome Description'
    on_depot false
    out_of_order true
    out_of_order_note 'Awesome Text'
    user
    location
  end
end
