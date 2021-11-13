module Api
  class ProductsController < ApplicationController
    def index
      service = Api::Products::IndexService.new
      @result = service.execute
      p @result
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
      if(@result == true)
        render json: { message: 'ok' }, status: :ok
      else
        render json: @result, status: :precondition_failed
      end
    end

    def destroy
      service = Api::Products::DestroyService.new
      @result = service.execute(params)
    end

    def show
      service = Api::Products::SearchService.new(params)
      @products = service.execute
    end
  end
end
