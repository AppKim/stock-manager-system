module Api
    module StockServices
        class SearchService
            def initialize(params)
                @params = params
            end
            
            def execute
                serach_stock
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
                 .where(
                    case @params[:type]
                        when "0" then st_pr_id = @params[:query]
                        when "1" then pr_ca_id = @params[:query]
                        when "2" then br_name = @params[:query]
                    end
                 )
                 .group('stocks.st_pr_id')
            end
        end
    end
end