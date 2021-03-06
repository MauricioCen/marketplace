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
class AddressSerializer < ApplicationSerializer
  attributes :id, :name, :first_address, :int_number, :ext_number, :zip_code, :references, :city, :state
  belongs_to :user
end
