module Api
  module Categories
    class IndexService
      def initialize; end

      def execute
        get_category_list
      end

      private

      def get_category_list
        @category = Category.all
      end
    end
  end
end
