# frozen_string_literal: true

class CreateAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :assets do |t|
      t.string :name
      t.text :url
      t.references :product_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
