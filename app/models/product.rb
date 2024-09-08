class Product < ApplicationRecord
#   Name - presence - uniqueness
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: { greater_than: 0}
  validates :description, presence: true
  validates :description, length: { in: 10..500 }
  
# Price - presence - numericality and not a negative number or 0
# Description - length of a minimum of 1 and a maximum of 500 characters






  
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
end
