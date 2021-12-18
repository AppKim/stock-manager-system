module Api
    module StockServices
        class DetailService
            def initialize(params)
                @params = params
            end
            
            def execute
                get_stock_detail
            end

            private
            # attr_reader란 인스턴스변수(선두에 @가 달린변수)를 읽을때 사용
            attr_reader :params
            def get_stock_detail
                @result = Stock.joins(product: :brand)
                .select('
                    stocks.st_pr_id,
                    products.pr_name, 
                    products.pr_ca_id, 
                    brands.br_name, 
                    products.pr_price,
                    products.pr_expiration, 
                    count(stocks.st_pr_id) as count'
                )
                .where(
                    st_pr_id: params[:st_pr_id]
                )
                .group(
                    'stocks.st_pr_id'
                )
            rescue StandardError => e
                result.store('message', e.message)
                Rails.logger.error(e.message)
                Rails.logger.error(e.backtrace.join("\n"))
            end
        end
    end
end