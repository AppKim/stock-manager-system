module Api
  class ProductsController < ApplicationController
    def index
      service = Api::Products::IndexService.new
      @result = service.execute
    end

    def create
      service = Api::Products::CreateService.new(params)
      @res = service.execute
      if @res[:result].eql? 'success'
        render json: @res, status: :created
      else
        render json: @res, status: :internal_server_error
      end
    end

    def update
      service = Api::Products::UpdateService.new(params)
      @result = service.execute
      if @result == true
        render json: { message: 'ok' }, status: :ok
      else
        render json: @result, status: :precondition_failed
      end
    end

    def destroy
      service = Api::Products::DestroyService.new(params)
      @result = service.execute
      if @result == true
        render json: { message: 'ok' }, status: :ok
      else
        render json: @result, status: :gone
      end
    end

    def show
      service = Api::Products::SearchService.new(params)
      @products = service.execute
    end
  end
end
