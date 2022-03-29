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
class Contact < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  pg_search_scope :search, against: %i[name last_name], using: {
    tsearch: { prefix: true }
  }
end
