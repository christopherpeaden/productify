Rails.application.routes.draw do
  root 'categories#index'

  resources :categories

  resources :lists do
    resources :items
  end

end
