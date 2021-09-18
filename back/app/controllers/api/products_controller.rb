module Api
  class ProductsController < ApplicationController
    def index
      service = Api::Products::IndexService.new
      @result = service.execute
    end

    def create
      service = Api::Products::CreateService.new(params)
      service.execute
    end
  end
end
