Rails.application.routes.draw do
  root to: "trips#index"
  resources :trips do
    resources :comments
	resources :posts
  end
  resources :users do
	resources :profiles
  end
  resource :session, only: [:new, :create, :destroy]
  get 'login' => "sessions#new", as: "login"
  get 'logout' => "sessions#destroy", as: "logout"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
