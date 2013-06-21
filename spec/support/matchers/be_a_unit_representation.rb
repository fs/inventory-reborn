RSpec::Matchers.define :be_a_unit_representation do |unit|
  match do |json|
    response_attributes = unit.sliced_attributes %w[
      unit_type
      inv_id
      name
      description
      on_depot
      out_of_order
    ]

    expect(json).to be
    expect(json).to include_attributes(response_attributes)
  end
end
