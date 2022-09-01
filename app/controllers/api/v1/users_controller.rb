# frozen_string_literal: true

module Api
  module V1
    # controller for showing user account
    class UsersController < ApplicationController
      def show; end

      def auth
        render json: { user: current_user,
                       cart: current_user.carts.first.as_json(
                         include:
                         {
                           products: { include: :unit }, carts_products: {}
                         }
                       ) }, status: :ok
      end
    end
  end
end
