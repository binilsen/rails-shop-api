class Api::V1::ProcessCartsController < ApplicationController
  def add
    cart = user_cart
    product = Product.find params[:id]
    selected_product = check_product(cart, product)
    if selected_product
      product_quantity_manager(selected_product, add: true)
    else
      selected_product = cart.carts_products.create(product:)
    end

    post_process(cart, selected_product)
    render json: { success: true, product: selected_product, products: user_cart.carts_products, cart: }
  end

  private

  def check_product(cart, product)
    cart.carts_products.find_by(product_id: product)
  end

  def product_quantity_manager(product, add: false)
    return product.update(quantity: product.quantity + 1) if add

    product.update(quantity: product.quantity - 1)
  end

  def post_process(cart, product)
    product.update_subtotal
    cart.update_total
  end
end
