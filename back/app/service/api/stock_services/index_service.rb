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
                # @stock = Stock.all
                @stock = Stock.joins(:product).select('stocks.* , products.*')
                # @stock = Stock.find_by(st_id: 1)
                # logger.debug(@stock)
            end
        end
    end
end