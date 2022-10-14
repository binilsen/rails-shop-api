# frozen_string_literal: true

module Api
  module V1
    class ProductsController < ApplicationController
      before_action :authenticate_user!, except: %i[index show]
      # GET /products
      def index
        @products = Product.all
        render json: @products.as_json(include: :category)
      end

      def show
        render json: Product.find(params[:id])
      end
    end
  end
end
