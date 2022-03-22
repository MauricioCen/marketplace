# frozen_string_literal: true

# == Schema Information
#
# Table name: contacts
#
#  id           :bigint           not null, primary key
#  name         :string
#  last_name    :string
#  phone_number :string
#  secret_key   :string
#  user_id      :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :contact do
    name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    phone_number { FFaker::Lorem.word }
    secret_key { FFaker::Lorem.word }
    user
  end
end
