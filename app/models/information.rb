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
class Information < ApplicationRecord
  self.table_name = 'informations'
end
