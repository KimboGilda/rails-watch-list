Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  # A user can see all the lists
  # A user can see the details of a given list and its name
  # A user can create a new list
  resources :lists do
    resources :bookmarks, only: [:new, :create, :destroy]
  end
end
