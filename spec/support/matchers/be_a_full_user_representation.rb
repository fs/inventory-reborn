RSpec::Matchers.define :be_a_full_user_representation do |user|
  match do |json|
    json.should be_a_user_representation(user, 'authentication_token')
  end
end
