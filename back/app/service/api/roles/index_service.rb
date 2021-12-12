module Api
  module RoleServices
    class IndexService
        def initialize
        end
        
        def execute
            get_role_list
        end

        private
        def get_role_list
            @role = Role.all
        end
    end
  end
end