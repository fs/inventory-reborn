RSpec::Matchers.define :be_a_location_representation do |location|
  match do |json|
    response_attributes = location.sliced_attributes %w[
      id
      name
    ]

    expect(json).to be
    expect(json).to include_attributes(response_attributes)
  end
end
