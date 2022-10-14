class Order
  include Mongoid::Document
  include Mongoid::Timestamps
  field :order_status, type: Integer, default: 0
  field :total, type: Float, default: 0
  belongs_to :user, index: true
  has_many :orders_products, dependent: :destroy
  belongs_to :address
end
