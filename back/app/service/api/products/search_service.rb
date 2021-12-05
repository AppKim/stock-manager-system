module Api
  module Products
    class SearchService
      def initialize(params) 
      @params = params
      end
      def execute
        get_product_list
      end

      private
      attr_reader :params
      def get_product_list
        @products = Product.search(params)
      end
    end
  end
end