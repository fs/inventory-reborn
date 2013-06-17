InventoryReborn::Application.routes.draw do
  # Devise
  #
  devise_for :users, only: []
  devise_scope :user do
    post 'users/sign_in', to: 'sessions#create'
  end

  if defined? ApiTaster::Engine
    mount ApiTaster::Engine => '/api_taster' if defined? ApiTaster::Engine
    root to: ApiTaster::Engine
  end
end
