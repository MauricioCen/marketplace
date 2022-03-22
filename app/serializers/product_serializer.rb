# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  price       :float            default(0.0)
#  discount    :float            default(0.0)
#  stock       :integer          default(0)
#  category_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string
#
class ProductSerializer < ApplicationSerializer
  attributes :id, :name, :description, :price, :discount, :stock, :slug
  belongs_to :category
end
