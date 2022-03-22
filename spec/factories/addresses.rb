# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id            :bigint           not null, primary key
#  name          :string
#  first_address :string
#  int_number    :string
#  ext_number    :string
#  zip_code      :string
#  references    :string
#  city          :string
#  state         :string
#  user_id       :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
FactoryBot.define do
  factory :address do
    name { FFaker::Lorem.word }
    first_address { FFaker::Lorem.word }
    int_number { FFaker::Lorem.word }
    ext_number { FFaker::Lorem.word }
    zip_code { FFaker::Lorem.word }
    references { FFaker::Lorem.paragraph }
    city { FFaker::Address.city }
    state { FFaker::Lorem.word }
    user
  end
end
