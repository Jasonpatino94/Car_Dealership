Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :customers do
    resources :vehicles, only: [:index] 
  end
  resources :dealerships do
    resources :vehicles, only: [:index]
  end
  resources :vehicles
  resources :customers, only: [:new, :create, :show]
  
  get "/login", to: "sessions#login", as: :login
  post "/login", to: "sessions#logged_in", as: :logged_in

  delete "/logout", to: "sessions#logout", as: :logout
end


  # get "/home" to  "home"
# end
