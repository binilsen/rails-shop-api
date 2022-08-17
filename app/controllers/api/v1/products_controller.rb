# frozen_string_literal: true

module Api
  module V1
    class ProductsController < ApplicationController
      before_action :authenticate_user!
      # GET /products
      def index
        @products = Product.all
        render json: @products
      end
    end
  end
end
