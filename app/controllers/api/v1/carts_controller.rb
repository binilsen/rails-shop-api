class Api::V1::CartsController < ApplicationController
  def index
    return render json: user_cart.carts_products.as_json(include: %i[product cart]) if user_cart

    render json: []
  end

  def show
    render json: Cart.find(params[:id]).carts_products.as_json(include: %i[product cart])
  end

  def place_order
    return buy_now if params[:id]=='buy-now'
    cart = Cart.find(params[:id])
    order = Order.create(user_id: current_user._id, total: cart.total,address: order_params[:address])
    add_order_products(cart.carts_products, order)
    return render json: {success:true, order_id: order._id} if cart.destroy

    not_found
  end

  private
  
  def buy_now
   product= Product.find(order_params[:product]);
   order=current_user.orders.create(total: (product.price+tax_calculator(product.price)),address: order_params[:address])
   OrdersProduct.create(order_id: order.id, product_id: product._id, quantity: 1)
   render json: {success: true,order_id: order._id}
  end

  def order_params
    params.require(:order).permit(:address,:product)
  end
  def add_order_products(cart_items, order)
    cart_items.each do |cart_item|
      OrdersProduct.create(order_id: order.id, product_id: cart_item.product_id, quantity: cart_item.quantity)
    end
  end
   def tax_calculator(price)
    ((price*ELECTRONICS)/100).to_i
  end
end
