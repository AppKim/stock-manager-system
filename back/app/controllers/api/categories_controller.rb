module Api
  class CategoriesController < ApplicationController
      def index
        service = Api::CategoryServices::IndexService.new
        @result = service.execute
      end
  end
end