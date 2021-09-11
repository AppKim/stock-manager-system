module Api
    module BrandServices
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