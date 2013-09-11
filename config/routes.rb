InventoryReborn::Application.routes.draw do
  # Devise
  #
  devise_for :users, only: []
  devise_scope :user do
    post 'users/sign_in', to: 'sessions#create'
  end

  resources :users, only: :index do
    resources :units, only: :index
  end

  resources :rooms, only: [:index, :show] do
    resources :units, only: :index
  end

  resources :units, only: [:index, :show, :create, :update]

  if defined? ApiTaster::Engine
    mount ApiTaster::Engine => '/api_taster'
    root to: ApiTaster::Engine
  end
end
