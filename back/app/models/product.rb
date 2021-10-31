class Product < ApplicationRecord
    has_many :stock # 부모
    belongs_to :brand, foreign_key: :pr_br_id, primary_key: :br_id
    belongs_to :category, foreign_key: :pr_ca_id, primary_key: :ca_id
end