Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :bookmarks, only: %i[destroy]
  resources :lists do
    resources :bookmarks, only: %i[new create]
  end
  # Defines the root path route ("/")
  root 'lists#index'
end
