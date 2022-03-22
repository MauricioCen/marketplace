# frozen_string_literal: true

class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :last_name
      t.string :phone_number
      t.string :secret_key
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
