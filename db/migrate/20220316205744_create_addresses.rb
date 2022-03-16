# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :first_name
      t.string :int_number
      t.string :ext_number
      t.string :zip_code
      t.string :references
      t.string :city
      t.string :state
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
