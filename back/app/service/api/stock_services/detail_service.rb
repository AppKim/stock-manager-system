module Api
    module StockServices
        class DetailService
            def initialize
            end
            
            def execute
                get_stock_detail
            end

            private
            def get_stock_detail(param)
                p params[:st_id]
                p params[:st_pr_id]
                p params[:pr_expiration]
                @result = Stock.joins(product: :brand)
                .select(
                'stocks.st_pr_id, 
                products.pr_ca_id, 
                brands.br_name, 
                products.pr_price,
                products.pr_expiration, 
                count(stocks.st_pr_id) as count')
                .where(stocks.st_id: params[:st_id] 
                        and stocks.st_pr_id:params[:st_pr_id]
                        and products.pr_expiration: params[:pr_expiration])
                .group('stocks.st_pr_id')
            end
        end
    end
end