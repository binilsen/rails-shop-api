class Api::V1::OrdersController < ApplicationController
    def index
      render json: current_user.orders.order_by(created_at: :desc).all
    end

    def show
      order=Order.find(params[:id])
      render json: {order: order.as_json(include: {address: {include: :address_type} }),products: order.orders_products.as_json(include: :product)}
    end
    def order_again
      order=current_user.orders.create(total: params[:total],address: params[:address])
      add_order_products(params[:products],order)
      render json: {success: true,id: order._id}
    end

    private

    def order_params
      params.require(:order).permit(:total,:products,:address)
    end

    def add_order_products(cart_items, order)
      cart_items=JSON.parse(cart_items)
      cart_items.each do |product|
        p OrdersProduct.create(order_id: order.id, product_id: product["_id"], quantity: product["quantity"])
      end
    end
end
