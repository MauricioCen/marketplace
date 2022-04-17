# frozen_string_literal: true

module Promotions
  class Index
    include Interactor
    def call
      context.query = filter? ? promotions.search(filter) : promotions
    end

    private

    def promotions
      Product.where('discount > 0')
    end

    def filter
      context.params[:q]
    end

    def filter?
      filter.present?
    end
  end
end
