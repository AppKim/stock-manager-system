module Api
  module ProductServices
    class UpdateService
      def initilalize
        ;
      end

      def execute(params)
        @product = Product.find(params[:id])

        # TODO: 이미지 변경이 있을시 기존이미지 삭제 -> 다시 저장 -> image_url 업데이트
        @post.update(
          pr_name: params[:productName],
          pr_price: params[:productPrice],
          pr_brand: params[:productBrand],
          pr_barcode: params[:productBarcode],
          pr_image: image_url
        )
      end
    end
  end
end