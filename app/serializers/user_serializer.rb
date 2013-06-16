class UserSerializer < BaseSerializer
  attributes :id, :authentication_token, :email, :full_name

  def include_authentication_token?
    options[:full_representation]
  end
end
