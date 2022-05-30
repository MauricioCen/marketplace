# frozen_string_literal: true

class CreateInformations < ActiveRecord::Migration[7.0]
  def change
    create_table :informations do |t|
      t.string :name
      t.text :description
      t.string :phone_number
      t.text :email
      t.timestamps
    end
  end
end
