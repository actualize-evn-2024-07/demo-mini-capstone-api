class Product < ApplicationRecord
#   Name - presence - uniqueness
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: { greater_than: 0}
  validates :description, presence: true
  validates :description, length: { in: 10..500 }
  
# Price - presence - numericality and not a negative number or 0
# Description - length of a minimum of 1 and a maximum of 500 characters

  belongs_to :supplier
  has_many :images
  # def supplier
    # Supplier.find_by(id: supplier_id)
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

  # def friendly_image
  #   if images.length > 0
  #     return images[0].url
  #   else
  #     return "https://snworksceo.imgix.net/rce/26b94560-9203-4db4-9d67-40310ef65e60.sized-1000x1000.jpeg?w=1000"
  #   end
  # end

  def images_with_default
    if images.length > 0
      return images
    else
      return [
        {id: 100, url: "https://media.gq.com/photos/5582f8c409f0bee56440b484/master/pass/entertainment-2011-05-cage-match-nic-cage_300x430.jpg", created_at: Time.now, updated_at: Time.now}
      ]
    end
    # if product has at least one image, use that
    # if the product doesn't have any images, deafult to "https://media.gq.com/photos/5582f8c409f0bee56440b484/master/pass/entertainment-2011-05-cage-match-nic-cage_300x430.jpg"
  end
end
