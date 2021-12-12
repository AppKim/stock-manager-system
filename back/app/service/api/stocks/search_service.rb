module Api
  module Stocks
    class SearchService
      def initialize(params)
        @params = params
        @response = {
          result: ''
        }
      end

      def execute
        serach_stock
        @response
      end

      private

      def serach_stock
        if @params[:query] != ''
          case @params[:type]
          when '0'
            key = 'stocks.st_pr_id = ?'
          when '1'
            key = 'products.pr_ca_id = ?'
          when '2'
            key = 'brands.br_name like ?'
            @params[:query] = '%' + @params[:query] + '%'
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
        @response[:result] = @result
      rescue StandardError => e
        @response[:result] = 'fail'
        @response.store('message', e.message)
        Rails.logger.error(e.message)
        Rails.logger.error(e.backtrace.join("\n"))
      end
    end
  end
end
