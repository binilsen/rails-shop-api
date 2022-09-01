# frozen_string_literal: true

module Api
  module V1
    # controller for managing user  order
    class OrdersController < ApplicationController
      def index
        @orders = current_user.orders.order(created_at: :desc)
        render json: @orders
      end

      def show
        @order = Order.find(params[:id])
        @cart = @order.orders_products.all
        render json: @order.as_json(include: %i[products orders_products], root: true)
      end

      def buy_now
        new_cart = create_cart(flag: true)
        CartsProduct.create(product_id: params[:id], cart_id: new_cart.id)
        redirect_to carts_path
      end

      def place_order
        get_cart = create_cart
        order = Order.create(user_id: current_user.id, total: get_cart.cart_total)
        add_order_products(get_cart.carts_products, order)
        get_cart.destroy
        session.delete(:cart_id)
        render json: { message: :success }, status: :ok
      end

      private

      def add_order_products(cart_items, order)
        cart_items.each do |cart_item|
          OrdersProduct.create(order_id: order.id, product_id: cart_item.product_id,
                               quantity: cart_item.product_quantity)
        end
      end
    end
  end
end
