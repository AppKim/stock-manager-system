module Api
  class StocksController < ApplicationController
    def index
      service = Api::Stocks::IndexService.new
      # @result = service.execute
      # @result = Stock.find_by(st_id: 1235)
      # @result = Stock.joins(:product).select('stocks.* , products.*')
      @result = service.execute
    end

    def create
      service = Api::Stocks::CreateService.new(params)
      service.execute
    end

    def detail
      service = Api::Stocks::DetailService.new(params)
      @result = service.execute
    end

    def search
      service = Api::Stocks::SearchService.new(params)
      @res = service.execute
      if @res[:result].present?
        if @res[:result].eql? 'fail'
          render json: @res, status: :internal_server_error
        else
          render json: @res['result'], status: :ok
        end
      else
        render status: :no_content
      end
    end
  end
end
