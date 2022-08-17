# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :title
      t.float :price
      t.integer :stock, default: 1
      t.string :thumbnail
      t.timestamps
    end
  end
end
