class Category < ApplicationRecord

  has_many :products

  def num_of_products?
    Product.where(category_id: id).count
  end 

end
