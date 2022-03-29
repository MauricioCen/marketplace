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
class Product < ApplicationRecord
  extend FriendlyId
  include PgSearch::Model
  belongs_to :category
  has_many :assets, dependent: :destroy
  friendly_id :name, use: :slugged
  pg_search_scope :search, against: %i[name description], using: {
    tsearch: { prefix: true }
  }
end
