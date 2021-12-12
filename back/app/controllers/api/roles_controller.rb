module Api
    class RolesController < ApplicationController
        def index
            service = Api::Roles::IndexService.new
            @result = service.execute
        end
    end
end