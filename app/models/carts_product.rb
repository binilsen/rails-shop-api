class CartsProduct
  include Mongoid::Document
  include Mongoid::Timestamps
  field :quantity, type: Integer, default: 1
  field :sub_total, type: Float, default: 0
  belongs_to :cart
  belongs_to :product

  def update_subtotal
    total = product.price * quantity
    update(sub_total: total)
  end
end
