class OrdersProduct
  include Mongoid::Document
  include Mongoid::Timestamps
  field :quantity, type: Integer
  belongs_to :order
  belongs_to :product
end
