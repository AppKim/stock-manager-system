module Api
    module Brands
        class IndexService
            def initialize
            end
            
            def execute
                get_brand_list
            end

            private
            def get_brand_list
                @brand = Brand.all
            end
        end
    end
end