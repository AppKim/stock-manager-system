module Api
  class ProductsController < ApplicationController
    def index
      service = Api::Products::IndexService.new
      @result = service.execute
    end

    def create
      service = Api::Products::CreateService.new(params)
      @result = service.execute
      if @result['message'].present?
        render json: @result['message'], status: :unprocessable_entity
      else
        render json: { message: 'created' }, status: :created
      end
    end

    def update
      service = Api::Products::UpdateService.new(params)
      @result = service.execute
    end

    def destroy
      service = Api::Products::DestroyService.new
      @result = service.execute(params)
    end
  end
end
