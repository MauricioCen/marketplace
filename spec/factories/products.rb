# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  price       :float            default(0.0)
#  discount    :float            default(0.0)
#  stock       :integer          default(0)
#  category_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string
#
FactoryBot.define do
  factory :product do
    name { FFaker::Lorem.word }
    description { FFaker::Lorem.paragraph }
    price { FFaker::Number.decimal }
    discount { 0 }
    stock { 10 }
    category
  end
end
