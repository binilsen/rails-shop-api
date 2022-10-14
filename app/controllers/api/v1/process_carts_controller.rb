class Api::V1::ProcessCartsController < ApplicationController
  before_action :find_product
  def add
    cart = user_cart || current_user.carts.create
    selected_product = check_product(cart, @product)
    if selected_product
      product_quantity_manager(selected_product, add: true)
    else
      selected_product = cart.carts_products.create(product: @product)
    end

    post_process(cart, product: selected_product)
    render json: { success: true, product: selected_product, products: user_cart.carts_products, cart: }
  end

  def remove
    cart=user_cart
    selected_product = check_product(cart,@product)
    isCart_item_remove = false
    if selected_product.quantity == 1
      isCart_item_remove = selected_product.destroy
    else
      product_quantity_manager(selected_product, add:false)
    end
    if isCart_item_remove 
      post_process(cart, product:false)
    else 
      post_process(cart, product: selected_product)
    end
    render json: {success: true, product: selected_product, products:user_cart.carts_products,cart:,remove:isCart_item_remove}
  end

  private

  def find_product
    @product = Product.find params[:id]
  end
  def check_product(cart, product)
    cart.carts_products.find_by(product_id: product)
  end

  def product_quantity_manager(product, add: false)
    return product.update(quantity: product.quantity + 1) if add

    product.update(quantity: product.quantity - 1)
  end

  def post_process(cart, product: false)
    product.update_subtotal if product
    cart.update_total
  end
end
