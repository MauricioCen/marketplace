# frozen_string_literal: true

module Promotions
  module Products
    class Index
      include Interactor

      def call
        context.query = filter? ? products.search(filter) : products
      end

      private

      def products
        Product.all
      end

      def filter
        context.params[:q]
      end

      def filter?
        filter.present?
      end
    end
  end
end
