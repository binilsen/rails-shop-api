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
    update(total:total)
  end
end
