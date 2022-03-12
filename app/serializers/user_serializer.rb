# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  last_name  :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserSerializer < ApplicationSerializer
  attributes :id, :name, :last_name, :email
end
