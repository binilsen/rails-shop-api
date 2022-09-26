class Api::V1::CartsController < ApplicationController
  def index
    render json: user_cart.as_json(include: 'carts_products')
  end

  def show
    render json: Cart.find(params[:id]).carts_products.as_json(include: %i[product cart])
  end
end
