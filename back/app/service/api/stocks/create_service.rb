module Api
    module Stocks
        class CreateService
            def initialize(params)
                @params = params
            end

        def execute
            add_stock
        end

        private

        attr_reader :params
        def add_stock
            ApplicationRecord.transaction do
                stock = Stock.new(
                    st_id: 1,
                    st_pr_id: 1,
                    st_exist: params[:st_exist],
                    created_at: params[:created_at],
                    updated_at: params[:updated_at],
            )
            stock.save!
        end
            rescue StandardError => e
                Rails.logger.error(e.message)
                Rails.logger.error(e.backtrace.join("\n"))
            end
        end
    end
end
