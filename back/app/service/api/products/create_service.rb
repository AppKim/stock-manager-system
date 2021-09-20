module Api
  module Products
    class CreateService
      def initialize(params)
        @params = params
      end

      def execute
        add_product
      end

      private

      attr_reader :params
      def add_product
        if params[:productImage].present?
          image_url = "public/product_images/#{params[:productImage].original_filename}"
        end
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
        Rails.logger.error(e.message)
        Rails.logger.error(e.backtrace.join("\n"))
      end

      def upload_image
        File.binwrite("public/product_images/#{image_url}", params[:productImage].read)
      end
    end
  end
end
