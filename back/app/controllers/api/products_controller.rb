module Api
  class ProductsController < ApplicationController
    def index
      service = Api::Product::IndexService.new
      @result = service.execute
    end

    def create
      p "image:#{params[:productImage].original_filename}"
      File.binwrite("public/product_images/#{params[:productImage].original_filename}", params[:productImage].read)
      service = Api::Product::CreateService.new(params)
      service.execute
    end
  end
end
