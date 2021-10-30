module Api
  class ProductsController < ApplicationController
    def index
      service = Api::Products::IndexService.new
      @result = service.execute
      p @result
    end

    def create
      service = Api::Products::CreateService.new(params)
      service.execute
    end

    def update
      service = Api::Products::UpdateService.new
      @result = service.execute(params)
    end

    def destroy
      @product = Product.find(params[:id])
      service = Api::Products::DestroyService.new
      @result = service.execute(params)
    end

    def show
      service = Api::Products::SearchService.new(params)
      @products = service.execute
    end
  end
end
