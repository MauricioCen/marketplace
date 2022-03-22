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
class ContactSerializer < ApplicationSerializer
  attributes :id, :name, :last_name, :phone_number, :secret_key
  belongs_to :user
end
