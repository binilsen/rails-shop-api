# frozen_string_literal: true

module Types
  class CategoryType < Types::BaseObject
    field :name, String, null: false
    field :title, String, null: false
    field :slug, String, null: false
    field :products, [Types::ProductType], null: false
  end
end
