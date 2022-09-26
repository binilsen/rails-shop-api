# frozen_string_literal: true

module Api
  module V1
    class CategoryController < ApplicationController
      def index
        render json: Category.all
      end

      def show
        render json: Category.find(params[:id]).products.as_json(include: :category)
      end
    end
  end
end
