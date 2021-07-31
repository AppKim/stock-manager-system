module Api
    class RolesController < ApplicationController
        def index
            service = Api::RoleServices::IndexService.new
            @result = service.execute 
            # @result = Role.all
        end
    end
end