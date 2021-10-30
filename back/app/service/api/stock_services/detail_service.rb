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
            def get_stock_detail
                @result = Stock.joins(product: :brand)
                .select(
                'stocks.st_pr_id, 
                products.pr_ca_id, 
                brands.br_name, 
                products.pr_price,
                products.pr_expiration, 
                count(stocks.st_pr_id) as count')
                .where(stocks.st_id: params[:st_id] 
                        ,stocks.st_pr_id: params[:st_pr_id])
                .group('products.pr_expiration')
            end
        end
    end
end