# frozen_string_literal: true

module Api
  module V1
    # controller managing cart item quantity
    class CartsProductsController < ApplicationController
      before_action :find_cart

      def add
        if @product
          @product.update_quantity(add: true)
        else
          @product = CartsProduct.create(product_id: params[:id], cart_id: @cart.id)
        end
        @cart.update_cart_total
        render json: { quantity: @product.quantity,
                       cart: @cart.as_json(include: { products: { include: :unit }, carts_products: {} }) }
      end

      def remove
        @remove_product = @product.delete_product if @product.product_quantity == 1
        @is_cart_empty = delete_cart if @cart.cart_empty?
        @product.update_quantity(add: false) if @product.product_quantity > 1
        @cart.update_cart_total unless @cart.cart_empty?
        render json: { quantity: @product.quantity, remove: @remove_product,
                       cart: @cart.as_json(include: { products: { include: :unit }, carts_products: {} }) }
      end

      private

      def find_cart
        @cart = create_cart
        @cart = create_cart(flag: true) if @cart.blank?
        @product = @cart.carts_products.find_by(product_id: params[:id])
      end

      def delete_cart
        @cart.destroy_cart
        session.delete(:cart_id)
      end
    end
  end
end
