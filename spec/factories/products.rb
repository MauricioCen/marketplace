# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  price       :float
#  discount    :float            default(0.0)
#  stock       :integer          default(0)
#  category_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
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
