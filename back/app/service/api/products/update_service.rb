module Api
  module Products
    class UpdateService
      def initilalize
        ;
      end

      def execute(params)
        @product = Product.find(params[:id])

        # TODO: 이미지 변경이 있을시 기존이미지 삭제 -> 다시 저장 -> image_url 업데이트
        @product.update(
          pr_name: params[:productName],
          pr_price: params[:productPrice],
          pr_br_id: params[:productBrand],
          pr_barcode: params[:productBarcode],
          # pr_expiration: params[:productExpiration],
          # pr_image: image_url
        )
      end
    end
  end
end