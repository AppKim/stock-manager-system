module Api
  module Products
    class CreateService
      def initialize(params)
        @params = params
        @response = {
          result: 'success'
        }
      end

      def execute
        add_product
        @response
      end

      private

      attr_reader :params, :response

      def add_product
        ApplicationRecord.transaction do
          product = Product.new(
            pr_us_id: 1,
            pr_ca_id: 1,
            pr_br_id: params[:productBrand],
            pr_name: params[:productName],
            pr_price: params[:productPrice],
            pr_barcode: params[:productBarcode],
            pr_expiration: params[:productExpiration],
            image: params[:productImage]
          )
          product.save!
        end
      rescue StandardError => e
        Rails.logger.error(e.message)
        Rails.logger.error(e.backtrace.join("\n"))
        response[:result] = 'fail'
        response.store(:message, e.message)
      end
    end
  end
end
