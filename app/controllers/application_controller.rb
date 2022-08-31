# frozen_string_literal: true

# base controller
class ApplicationController < ActionController::API
  before_action :authenticate_user!
  def create_cart(flag: false)
    if flag
      @cart = Cart.new
      @cart.user_id = current_user.id
      @cart.save
      @cart = Cart.last
    else
      @cart = current_user.carts.order(id: :desc).find_by(processed: false)
    end
    session[:cart_id] = @cart.id if @cart
    @cart
  end
end
