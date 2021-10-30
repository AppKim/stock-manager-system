module Api
    module StockServices
        class SearchService
            def initialize(params)
                @params = params
            end
            
            def execute
                serach_stock(:params)
            end

            private
            def serach_stock
                 @result = Stock.joins(product: :brand)
                 .select(
                'stocks.st_pr_id, 
                 products.pr_ca_id, 
                 brands.br_name, 
                 products.pr_price, 
                 count(stocks.st_pr_id) as count')
                 .group('stocks.st_pr_id')
            end
        end
    end
end