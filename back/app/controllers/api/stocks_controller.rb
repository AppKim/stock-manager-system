module Api
    class StocksController < ApplicationController
        def index
            service = Api::Stocks::IndexService.new
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
          service = Api::Stocks::CreateService.new(params)
          service.execute
        end

        def detail
            service = Api::Stocks::DetailService.new(params)
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
