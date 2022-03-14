# frozen_string_literal: true

# == Schema Information
#
# Table name: assets
#
#  id         :integer          not null, primary key
#  name       :string
#  url        :text
#  product_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class AssetSerializer < ApplicationSerializer
  attributes :id, :name, :url
  belongs_to :product
end
