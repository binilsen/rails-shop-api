module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :products, [ProductType], null: false
    field :categories, [CategoryType], null: false
    field :product, [ProductType], null: false do
      argument :slug, String, required: true
    end
    field :category_products, [ProductType], null: false do
      argument :slug, String, required: true
    end
    def products
      Product.all
    end

    def categories
      Category.all
    end

    def product(slug)
      Product.find(slug[:slug])
    end

    def category_products(slug)
      Category.find(slug[:slug]).products
    end
  end
end
