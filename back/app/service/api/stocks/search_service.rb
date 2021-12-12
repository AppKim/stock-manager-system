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
                if @params[:query] != ''
                    case @params[:type]
                        when "0" then 
                            key = "stocks.st_pr_id = ?"
                        when "1" then 
                            key = "products.pr_ca_id = ?"
                        when "2" then 
                            key = "brands.br_name like ?"
                            @params[:query] = "%"+@params[:query]+"%"   
                    end
                end

                @result = Stock
                .joins(
                    product: :brand
                ).select('
                    stocks.st_pr_id, 
                    products.pr_ca_id, 
                    brands.br_name, 
                    products.pr_price, 
                    count(stocks.st_pr_id) as count
                ').where(
                    key, @params[:query]
                ).group(
                    'stocks.st_pr_id'
                )
                
                p @result
                rescue StandardError => e
                    result.store('message', e.message)
                    Rails.logger.error(e.message)
                    Rails.logger.error(e.backtrace.join("\n"))
            end
        end
    end
end