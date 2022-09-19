# frozen_string_literal: true

# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  scope 'api/v1' do
    devise_for :users, skip: %i[sessions registrations], controllers: { omniauth_callbacks: 'api/v1/users/omniauth_callbacks' },
                       defaults: { format: :json }
    devise_scope :user do
      post 'users', to: 'api/v1/users/registrations#create'
      post 'users/sign_in', to: 'api/v1/users/sessions#create'
      delete 'users/sign_out', to: 'api/v1/users/sessions#destroy'
    end
  end
  # route for api
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :carts, only: :show do
        member do
          get :place_order, controller: :orders
        end
      end
      # route for user+orders
      resources :users, only: :show do
        resources :orders, only: %i[show index]
      end
      # route for products + add/remove product + buy an item
      resources :products, controller: :pages, only: %i[index show] do
        member do
          post :add, controller: :carts_products
          post :remove, controller: :carts_products
          get :buy_now, controller: :orders
        end
      end
      post 'users/valid_auth', to: 'users#auth'
    end
  end
end
