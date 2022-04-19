# frozen_string_literal: true

# == Schema Information
#
# Table name: avatars
#
#  id         :bigint           not null, primary key
#  url        :text
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :avatar do
    url { FFaker::Internet.http_url }
    user
  end
end
