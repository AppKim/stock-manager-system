module Api
  class BrandsController < ApplicationController
    def index
      service = Api::Brands::IndexService.new
      @result = service.execute
    end
  end
end
