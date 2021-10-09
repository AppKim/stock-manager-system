module Api
  module Products
    class UpdateService
      attr_reader: params

      def initilalize(params)
        @params = params
      end

      def execute()
        @product = Product.find(params[:id])

        @product.update(
          pr_name: params[:productName],
          pr_price: params[:productPrice],
          pr_br_id: params[:productBrand],
          pr_barcode: params[:productBarcode],
          # pr_expiration: params[:productExpiration],
          pr_image: check_image(product[:pr_img])
        )
      end

      def check_image(old_image_url)
        new_image_url = params[:productImage].present? ? "public/product_images/#{params[:productImage].original_filename}" : ''
        if new_image_url
          File.binwrite(image_url, params[:productImage].read)
        else
          old_image_url
        end
          # TODO: 이미지 변경이 s있을시 기존이미지 삭제 -> 다시 저장 -> image_url 업데이트
      end
    end
  end
end