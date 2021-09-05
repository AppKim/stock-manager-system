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
                 @result = Stock.joins(:product).select('stocks.*, products.*, count(stocks.st_pr_id) as count').group('stocks.st_id')
            end
        end
    end
end