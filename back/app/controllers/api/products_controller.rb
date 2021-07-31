module Api
  class ProductsController < ApplicationController
    def index
      @result = {
        pr_id: 1 , 
        pr_ca_id: 2, 
        pr_br_id: 3, 
        pr_us_id: 4, 
        pr_price: 1000,
        pr_barcode: 'barcode',
        pr_img: 'img',
        pr_expiration: 'expiration', 
      }
      # service = Api::ProductServices::IndexService.new
      # @result = service.execute
    end
  end
end
