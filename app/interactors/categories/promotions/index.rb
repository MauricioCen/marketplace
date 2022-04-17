# frozen_string_literal: true

module Categories
  module Promotions
    class Index
      include Interactor

      def call
        context.query = filter? ? promotions.search(filter) : promotions
      end

      private

      def promotions
        Product.where(category_id: context.params[:category_id]).where("discount > #{context.discount}")
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
