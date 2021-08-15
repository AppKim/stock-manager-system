module Stocks
    class IndexService
        def initialize
        end
        
        def execute
            get_stock_list
        end

        private
        def get_stock_list
         #  @stock = Stock.ALL
            @stock = Stock.find_by(st_id: 1235)
            logger.debug(@stock)
        end
    end
end