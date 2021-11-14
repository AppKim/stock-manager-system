module Api
  module Products
    class UpdateService
      attr_reader :params

      def initialize(params)
        @params = params
      end

      def execute
        update_product
      end

      def check_update_image(old_image_url)
        if params[:productImage] != old_image_url
          new_image_url = "public/product_images/#{params[:productImage].original_filename}"
          # 등록된 이미지가 있다면 삭제
          if old_image_url.present?
            File.delete(old_image_url)
          end
          File.binwrite(new_image_url, params[:productImage].read)
          new_image_url
        else
          old_image_url
        end
      end

      def update_product
        ApplicationRecord.transaction do
          @product = Product.find(params[:id])
          productImage = check_update_image(@product.pr_img)
          
          # https://edgeapi.rubyonrails.org/classes/ActiveRecord/Persistence.html#method-i-update-21
          @product.update!(
            pr_name: params[:productName],
            pr_price: params[:productPrice],
            pr_br_id: params[:productBrand],
            pr_barcode: params[:productBarcode],
            pr_expiration: params[:productExpiration],
            pr_img: productImage
          )
        end
        rescue StandardError => e
          Rails.logger.error(e.message)
          e.message
        end
      end
    end
  end