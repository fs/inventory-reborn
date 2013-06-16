Rails3BaseApi::Application.routes.draw do
  # Devise
  #
  devise_for :users, only: []
  devise_scope :user do
    post 'users/sign_in', to: 'sessions#create'
  end

  resources :users, only: [] do
    resources :units, only: :index
  end

  resources :rooms, only: [] do
    resources :units, only: :index
  end

  resources :units, only: :index

  if defined? ApiTaster::Engine
    mount ApiTaster::Engine => '/api_taster' if defined? ApiTaster::Engine
    root to: ApiTaster::Engine
  end
end
