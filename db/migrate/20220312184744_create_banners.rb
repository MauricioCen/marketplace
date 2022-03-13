# frozen_string_literal: true

class CreateBanners < ActiveRecord::Migration[7.0]
  def change
    create_table :banners do |t|
      t.string :name
      t.text :link
      t.text :url
      t.timestamps
    end
  end
end
