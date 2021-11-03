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
        case params[:searchItems]
        when "1" then
           @products = Product.where(pr_id: params[:searchContent])
        when "2" then
          @products = Product.where(pr_ca_id: params[:searchContent])
        when "3" then
          @products = Product.where(pr_br_id: params[:searchContent])
        when "4" then
          @products = Product.where(pr_us_id: params[:searchContent])
        else

        end
      end
    end
  end
end