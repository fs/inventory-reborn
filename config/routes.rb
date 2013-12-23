InventoryReborn::Application.routes.draw do
  scope defaults: { format: :json } do
    devise_for :users, only: []
    devise_scope :user do
      post 'users/sign_in', to: 'sessions#create'
    end

    resources :users, only: :index do
      resources :units, only: :index
    end

    resources :locations, only: [:index, :show] do
      resources :units, only: :index
    end

    resources :units, only: [:index, :show, :create, :update]
  end

  root to: 'inventory_app#index'

  if defined? ApiTaster::Engine
    mount ApiTaster::Engine => '/api_taster'
  end
end
