Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :customers, only: [:new, :create, :show] do
    resources :vehicles, only: [:index, :edit]
  end
  resources :dealerships do
    resources :vehicles, only: [:index, :new, :create]
  end

  resources :vehicles, only: [:index, :show, :edit, :update, :destroy]
 
  
  post "/purchase", to: "vehicles#purchase", as: :purchase
  get "/login", to: "sessions#login", as: :login
  post "/login", to: "sessions#logged_in", as: :logged_in

  delete "/logout", to: "sessions#logout", as: :logout

  get '/auth/google_oauth2/callback', to: 'sessions#google_login'
  
  root "application#home"
end



# end
