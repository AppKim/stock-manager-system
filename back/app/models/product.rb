class Product < ApplicationRecord
  has_many :stock # 부모
  belongs_to :category, foreign_key: :pr_ca_id, primary_key: :ca_id
  belongs_to :brand, foreign_key: :pr_br_id, primary_key: :br_id # 자식
  validates :pr_price, presence: { message: 'pr_priceがございません' }

  scope :search, -> (params) do
    return if params.blank?
    
    product_name_like(params[:product_name])
      .brand(params[:brand])
      .category(params[:category])
  end

  scope :product_name_like, -> (product_name) { where('pr_name LIKE ?', "%#{product_name}%") if product_name.present? }
  scope :brand, -> (brand) { where('pr_br_id =', brand) if brand.present? }
  scope :category, -> (category) { where('pr_ca_id =', category) if category.present? }
  
end
