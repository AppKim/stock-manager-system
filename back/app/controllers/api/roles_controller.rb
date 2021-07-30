module Api
    class RolesController < ApplicationController
        def index
            # service = ::Api::Roles::IndexService.new
            # @result = service.execute
            @result = Role.all
        end
    end
end