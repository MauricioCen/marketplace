# frozen_string_literal: true

# == Schema Information
#
# Table name: assets
#
#  id         :integer          not null, primary key
#  name       :string
#  url        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Asset < ApplicationRecord
  belongs_to :product
end
