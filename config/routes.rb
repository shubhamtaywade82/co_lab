Rails.application.routes.draw do
  resources :users
  # Defines the root path route ("/")
  root "welcome#index"
end
