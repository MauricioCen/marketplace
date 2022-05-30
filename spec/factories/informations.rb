# frozen_string_literal: true

# == Schema Information
#
# Table name: informations
#
#  id           :bigint           not null, primary key
#  name         :string
#  description  :text
#  phone_number :string
#  email        :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :information do
    name { FFaker::Name.first_name }
    description { FFaker::Lorem.paragraph }
    phone_number { FFaker::PhoneNumber.phone_number }
    email { FFaker::Internet.unique.email }
  end
end
