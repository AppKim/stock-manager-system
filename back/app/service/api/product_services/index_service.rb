module Api
  module ProductServices
    class IndexService
      def initialize; end

      def execute
        get_product_list
      end

      private

      def get_product_list
        # @result = {
        #   pr_id: 1,
        #   pr_ca_id: 2,
        #   pr_br_id: 3,
        #   pr_us_id: 4,
        #   pr_price: 1000,
        #   pr_barcode: 'barcode',
        #   pr_img: 'img',
        #   pr_expiration: 'expiration'
        # }
        @result = Product.all
        p @result
      end
    end
  end
end
