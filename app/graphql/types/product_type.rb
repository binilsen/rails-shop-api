# frozen_string_literal: true


  class Types::ProductType < Types::BaseObject
    field :name, String, null: false
    field :title, String, null: false
    field :price, Float, null: false
    field :stock, Integer, null: false
    field :thumbnail, String, null: false
    field :slug, String
    field :category, Types::CategoryType, null: false
  end
