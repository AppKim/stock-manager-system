module Api
  module Products
    class DestroyService
      attr_reader :params

      def initialize(params)
        @params = params
      end

      def execute
        delete_product
      end

      def delete_product
        ApplicationRecord.transaction do
          @product = Product.find(params[:id])
          # https://edgeapi.rubyonrails.org/classes/ActiveRecord/Persistence.html#method-i-destroy-21
          @product == @product.destroy!
        rescue StandardError => e
          Rails.logger.error(e.message)
          e.message
        end
      end

    end
  end
end
