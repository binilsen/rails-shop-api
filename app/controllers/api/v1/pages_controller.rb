# frozen_string_literal: true

module Api
  module V1
    # home controller
    class PagesController < ApplicationController
      skip_before_action :authenticate_user!
      before_action :cart_products

      def index
        @products = Product.all
        render json: @products.as_json(include: :unit)
      end

      def show
        @product = Product.find(params[:id])
      end

      private

      def cart_products
        return unless current_user

        @user_products = Cart.find(session[:cart_id]).carts_products unless create_cart.blank?
      end
    end
  end
end
