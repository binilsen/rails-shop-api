# frozen_string_literal: true

# controller for displaying  cart
class CartsController < ApplicationController
  def show
    @cart = Cart.find(params[:id])
    return if @cart.blank? || @cart.carts_products.blank?

    render json: @cart.as_json(include: %i[products carts_products])
  end
end
