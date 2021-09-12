module Api
  module Product
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
