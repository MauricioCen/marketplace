# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  name                   :string
#  last_name              :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  phone_number           :string
#
class UserSerializer < ApplicationSerializer
  attributes :id, :name, :last_name, :email, :phone_number
  has_many :addresses
  has_many :contacts
end
