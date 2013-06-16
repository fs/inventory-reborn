class SessionsController < Devise::SessionsController
  wrap_parameters :user

  def create
    user = AuthenticationService.new(warden).authenticate!

    respond_with user,
      full_representation: true
  end
end
