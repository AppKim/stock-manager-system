module Api
    class StocksController < ApplicationController
        def index
            service = Api::StockServices::IndexService.new
            # @result = service.execute
            # @result = Stock.find_by(st_id: 1235)
            # @result = Stock.joins(:product).select('stocks.* , products.*')
            @result = service.execute
        end

        def create
            service = Api::StockServices::CreateService.new(params)
            service.execute
        end

        def detail
            service = Api::StockServices::DetailService.new(params)
            @result = service.execute
          end

        def search
            service = Api::StockServices::SearchService.new(params)
            p params
            @result = params
            # @result = service.execute(params)
        end

    end
end