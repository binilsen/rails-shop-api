# frozen_string_literal: true

# dummy model
class Product 
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug
  field :name, type: String
  field :title, type: String
  field :price, type: Float
  field :stock, type: Integer, default: 1
  field :thumbnail, type: String
  slug :name
  belongs_to :category, foreign_key: :category_id
  has_many :carts_products
end
