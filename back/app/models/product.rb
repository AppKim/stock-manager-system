class Product < ApplicationRecord
  has_many :stock # 부모
  validates :pr_price, presence: { message: 'pr_priceがございません' }
end
