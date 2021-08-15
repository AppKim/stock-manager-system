module Api
    class RolesController < ApplicationController
        def index
            service = Api::RoleServices::IndexService.new
            @result = service.execute
        end
    end
end