RSpec::Matchers.define :be_a_room_representation do |room|
  match do |json|
    response_attributes = room.sliced_attributes %w[
      id
      name
    ]

    expect(json).to be
    expect(json).to include_attributes(response_attributes)
  end
end
