module Api
  module Products
    class CreateService
      def initialize(params)
        @params = params
        @result = {}
      end

      def execute
        add_product
        result
      end

      private

      attr_reader :params, :result

      def add_product
        image_url = upload_image
        ApplicationRecord.transaction do
          product = Product.new(
            pr_us_id: 1,
            pr_ca_id: 1,
            pr_br_id: params[:productBrand],
            pr_name: params[:productName],
            pr_price: params[:productPrice],
            pr_barcode: params[:productBarcode],
            pr_expiration: params[:productExpiration],
            pr_img: image_url
          )
          product.save!
        end
      rescue StandardError => e
        result.store('message', e.message)
        Rails.logger.error(e.message)
        Rails.logger.error(e.backtrace.join("\n"))
      end

      def upload_image
        image_url = params[:productImage].present? ? "public/product_images/#{params[:productImage].original_filename}" : ''
        File.binwrite(image_url, params[:productImage].read) if image_url.present?
        image_url
      end
    end
  end
end
