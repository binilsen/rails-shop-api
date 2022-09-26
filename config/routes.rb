# frozen_string_literal: true

Rails.application.routes.draw do
  scope '/api/v1/' do
    post '/graphql', to: 'graphql#execute'
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      sessions: 'overrides/sessions'
    }
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # devise_for :users, defaults: { format: :json },
  #                    controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  namespace :api do
    namespace :v1 do
      resources :products
      resources :category
      resources :carts do
        resources :process_carts do
          member do
            get :add
          end
        end
      end
    end
  end
end
