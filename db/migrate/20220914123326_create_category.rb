# frozen_string_literal: true

class CreateCategory < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :title
      t.string :name
    end
  end
end
