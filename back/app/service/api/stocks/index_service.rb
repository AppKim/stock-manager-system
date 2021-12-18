module Api
    module Stocks
        class IndexService
            def initialize
                @response = {
                    result: '',
                }
            end
            
            def execute
                get_stock_list
            end

            private
            def get_stock_list
                 @result = Stock.joins(product: :brand)
                 .select(
                'stocks.st_pr_id, 
                 products.pr_ca_id, 
                 brands.br_name, 
                 products.pr_price, 
                 count(stocks.st_pr_id) as count')
                 .group('stocks.st_pr_id')
                 @response.store('result', @result )
                 print "★★これはprintメソッドです。★★"
                # p "hello world ; #{@response}"
            end

            rescue StandardError => e
                 result.store('message', e.message)
                Rails.logger.error(e.message)
                Rails.logger.error(e.backtrace.join("\n"))

        end
    end
end