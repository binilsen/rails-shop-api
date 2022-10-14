class Cart
  include Mongoid::Document
  include Mongoid::Timestamps
  field :total, type: Float, default: 0
  field :proccessed, type: Boolean, default: false
  has_many :carts_products
  belongs_to :user

  def update_total
    total = 0
    carts_products.each { |item| total += item.sub_total }
    return destroy if total == 0
    update(total: tax_calculator(total)+total)
  end

  def tax_calculator(price)
    ((price*ELECTRONICS)/100).to_i
  end
end
