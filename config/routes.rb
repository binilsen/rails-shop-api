# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users, defaults: { format: :json },
                     controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  namespace :api do
    namespace :v1 do
      resources :products
    end
  end
end
