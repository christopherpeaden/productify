Rails.application.routes.draw do
  root 'categories#index'

  resources :categories do
    resources :lists do
      resources :items
    end
  end

end
