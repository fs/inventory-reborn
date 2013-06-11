Rails3BaseApi::Application.routes.draw do
  # Devise
  #
  devise_for :users, only: []
  devise_scope :user do
    post 'users/sign_in', to: 'sessions#create'
  end

  mount ApiTaster::Engine => '/api_taster' if defined? ApiTaster::Engine
end
