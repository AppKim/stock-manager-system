module Api
    module StockServices
        class IndexService
            def initialize
            end
            
            def execute
                get_stock_list
            end

            private
            def get_stock_list
                 @result = Stock.joins(product: :brand)
                 .select(
                'stocks.st_id, 
                 stocks.st_pr_id, 
                 products.pr_ca_id, 
                 brands.br_name, 
                 products.pr_price, 
                 products.pr_expiration, 
                 count(stocks.st_pr_id) as count')
                 .group('stocks.st_pr_id')
            end
        end
    end
end