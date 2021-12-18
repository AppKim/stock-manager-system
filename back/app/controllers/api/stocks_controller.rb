module Api
    class StocksController < ApplicationController
        def index
            service = Api::StockServices::IndexService.new
            @result = service.execute
            # data가 있을때
            # data가 없을때
            # sql이 실패했을때
            if @result[:result].present?
              render json: @result['result'], status: :ok
            else
              render json: @result['message'], status: :unprocessable_entity
            end
        end

        def create
            service = Api::StockServices::CreateService.new(params)
            service.execute
        end

        def detail
            service = Api::StockServices::DetailService.new(params)
            @result = service.execute
            if @result.save
                # 리턴값이 true인경우
                render json: { message: 'detail' }, status: :detail
              else
                # false인경우
                render json: @result['message'], status: :unprocessable_entity
              end
        end

        def search
            service = Api::StockServices::SearchService.new(params)
            @result = service.execute
        end

    end
end