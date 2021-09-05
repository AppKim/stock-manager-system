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
                 @result = Stock.joins(:product).select('stocks.* , products.*,stocks(*) as count')
            end
        end
    end
end