# frozen_string_literal: true

# == Schema Information
#
# Table name: banners
#
#  id         :bigint           not null, primary key
#  name       :string
#  link       :text
#  url        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Banner < ApplicationRecord
end
