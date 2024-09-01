class ProductsController < ApplicationController
  def one
    @product = Product.find_by(id: 1)    
    # show is for 1 product
    render template: "products/show"
  end
end
