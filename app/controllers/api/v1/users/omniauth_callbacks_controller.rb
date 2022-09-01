# frozen_string_literal: true

module Api
  module V1
    module Users
      # controller for managing oauth callback
      class OmniauthCallbacksController < Devise::OmniauthCallbacksController
        def google_oauth2
          @user = User.from_omniauth(request.env['omniauth.auth'])
          if @user.persisted?
            sign_in @user
            render json: { user: current_user,
                           cart: current_user.carts.first.as_json(
                             include:
                            {
                              products: { include: :unit }, carts_products: {}
                            }
                           ) }, status: :ok
          else
            session['devise.google.data'] = request.env['omniauth.auth'].expect('extra')
            render json: { error: 'error occurred' }, status: :unauthorized
          end
        end

        def failure
          render json: 'error', status: :unauthorized
        end
      end
    end
  end
end
