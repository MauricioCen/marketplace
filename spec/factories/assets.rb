# frozen_string_literal: true

# == Schema Information
#
# Table name: assets
#
#  id         :bigint           not null, primary key
#  name       :string
#  url        :text
#  product_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :asset do
    name { FFaker::Lorem.word }
    url { FFaker::Internet.http_url }
    product
  end
end
