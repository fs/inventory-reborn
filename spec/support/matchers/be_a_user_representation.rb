RSpec::Matchers.define :be_a_user_representation do |user, *keys|
  match do |json|
    default_keys = %w[
      id
      email
      full_name
    ]
    keys.concat(default_keys)
    response_attributes = user.sliced_attributes keys

    json.should be
    json.should include_attributes(response_attributes)
  end
end
