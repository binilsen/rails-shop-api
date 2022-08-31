# frozen_string_literal: true

module Api
  module Users
    class SessionsController < Devise::SessionsController
      respond_to :json

      private

      def respond_with(_resource, _opt = {})
        if current_user
          return render json: { user: current_user,
                                cart: current_user.carts.first.as_json(
                                  include:
                                 {
                                   products: { include: :unit }, carts_products: {}
                                 }
                                ) }, status: :ok
        end

        render json: { error: 'Auth error.' }, status: :unauthorized
      end

      def respond_to_on_destroy
        log_out_success && return if current_user

        log_out_failure
      end

      def log_out_success
        render json: { message: 'You are logged out.' }, status: :ok
      end

      def log_out_failure
        render json: { error: 'Error occurred' }, status: :unauthorized
      end
    end
  end
end
