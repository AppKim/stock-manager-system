module Api
  module Products
    class DestroyService
      def initialize; end

      def execute(params)
        p params[:id]
        @product = Product.find(params[:id])
        @product.destroy
      end

    end
  end
end
