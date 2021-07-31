module Api 
  module ProductServices
    class IndexService
        def initialize
        end
        
        def execute
            get_product_list
        end
  
        private
        def get_product_list
            @result = Product.all
        end
    end
  end
end