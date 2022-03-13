# frozen_string_literal: true

# == Schema Information
#
# Table name: banners
#
#  id         :integer          not null, primary key
#  name       :string
#  link       :text
#  url        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :banner do
    name { FFaker::Lorem.word }
    link { FFaker::Internet.http_url }
    url { FFaker::Internet.http_url }
  end
end
