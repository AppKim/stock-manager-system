module Api
  class ProductsController < ApplicationController
    def index
      service = Api::ProductServices::IndexService.new
      @result = service.execute
    end
  end
end
