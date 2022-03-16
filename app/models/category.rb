# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#
class Category < ApplicationRecord
  extend FriendlyId
  has_many :products, dependent: :destroy
  friendly_id :name, use: :slugged
end
