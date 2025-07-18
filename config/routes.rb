Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "pages#index"

  # Pages Routes
  get "home", to: "pages#index"
  get "about", to: "pages#about"

  # Resources - Generate all the RESTful routes (index, show, new, edit, create, update, destroy)
  resources :articles

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
