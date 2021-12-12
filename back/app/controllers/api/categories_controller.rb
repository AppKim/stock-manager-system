module Api
  class CategoriesController < ApplicationController
      def index
        service = Api::Categories::IndexService.new
        @result = service.execute
      end
  end
end