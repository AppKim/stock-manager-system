module Api
  module Product
    class CreateService
      def initialize(params)
        @params = params
      end

      def execute; end

      private

      attr_reader :params
      def add_product
        image_url = "public/product_images/#{params[:productImage].original_filename}"
        product = Product.new(
          pr_name: params[:productName],
          pr_price: params[:productPrice],
          pr_brand: params[:productBrand],
          pr_barcode: params[:productBarcode],
          pr_image: image_url
        )
      end

      def upload_image
        File.binwrite("public/product_images/#{image_url}", params[:productImage].read)
      end
    end
  end
end
