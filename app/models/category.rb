# frozen_string_literal: true

class Category
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :title, type: String
  field :name, type: String
  field :slug, type: String
  has_many :products, dependent: :destroy
  slug :name

  index({ slug: 1 }, { unique: true, name: 'index_categories_on_slug' })
end
