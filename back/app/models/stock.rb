class Stock < ApplicationRecord
    belongs_to :product, foreign_key: :st_pr_id, primary_key: :pr_id # 자식
end
