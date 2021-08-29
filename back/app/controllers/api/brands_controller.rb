module Api
    class BrandsController < ApplicationController
        def index
            service = Api::BrandServices::IndexService.new
            @result = service.execute
        end
    end
end