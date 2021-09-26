class Product < ApplicationRecord
    has_many :stock # 부모
    belongs_to :brand, foreign_key: :pr_br_id, primary_key: :pr_id # 자식
end