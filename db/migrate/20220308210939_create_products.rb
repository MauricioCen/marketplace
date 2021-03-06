# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price, default: 0
      t.float :discount, default: 0
      t.integer :stock, default: 0
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
