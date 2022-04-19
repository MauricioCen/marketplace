# frozen_string_literal: true

module Contacts
  class Index
    include Interactor

    def call
      context.query = filter? ? contacts.search(filter) : contacts
    end

    private

    def contacts
      Contact.all
    end

    def filter
      context.params[:q]
    end

    def filter?
      filter.present?
    end
  end
end
