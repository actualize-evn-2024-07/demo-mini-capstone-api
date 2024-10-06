class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: { greater_than: 0}
  validates :description, presence: true
  validates :description, length: { in: 10..500 }

  belongs_to :supplier
  has_many :images
  has_many :category_products
  has_many :categories, through: :category_products

  # def categories
  #   categories = []
  #   category_products = CategoryProduct.where(product_id: id)
  #   category_products.each do |cp|
  #     categories << Category.find_by(id: cp.category_id)
  #   end
  #   categories
  # end



  
  def is_discounted?
    if price <= 10
      return true
    else
      return false
    end
  end

  def tax
    price * 0.09
  end

  def total
    tax + price
  end

  def images_with_default
    if images.length > 0
      return images
    else
      return [
        {id: 100, url: "https://media.gq.com/photos/5582f8c409f0bee56440b484/master/pass/entertainment-2011-05-cage-match-nic-cage_300x430.jpg", created_at: Time.now, updated_at: Time.now}
      ]
    end
  end
end
