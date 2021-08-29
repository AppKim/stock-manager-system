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
                 @result = Stock.joins(:product).select('stocks.* , products.*')
                 # @stock = Stock.find_by(st_id: 1)
                # logger.debug(@stock)
                # @result = {
                #       {st_id:1,
                #       st_pr_id:1,
                #       st_exist:1,
                #       pr_id:1,
                #       pr_ca_id:1,
                #       pr_br_id:1,
                #       pr_us_id:1,
                #       pr_price:"1010",
                #       pr_barcode:
                #       "1234567",
                #       pr_img:null,
                #       pr_expiration:
                #       "2022-08-11T12:00:00.000Z"},
                #       {st_id:2,
                #       st_pr_id:2,
                #       st_exist:1,
                #       pr_id:2,
                #       pr_ca_id:2,
                #       pr_br_id:2,
                #       pr_us_id:2,
                #       pr_price:"2000",
                #       pr_barcode:"7654321",
                #       pr_img:null,
                #       pr_expiration:"2022-08-11T12:00:00.000Z"},
                #       {st_id:3,
                #       st_pr_id:3,
                #       st_exist:1,
                #       pr_id:3,
                #       pr_ca_id:3,
                #       pr_br_id:3,
                #       pr_us_id:3,
                #       pr_price:"3000",
                #       pr_barcode:"4567890",
                #       pr_img:null,
                #       pr_expiration:"2022-08-11T12:00:00.000Z"},
                #     }
            end
        end
    end
end