# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  name       :string
#  first_name :string
#  int_number :string
#  ext_number :string
#  zip_code   :string
#  references :string
#  city       :string
#  state      :string
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Address < ApplicationRecord
  belongs_to :user
end
