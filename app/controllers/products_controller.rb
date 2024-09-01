class ProductsController < ApplicationController
  def index
    @products = Product.all
    render template: "products/index"
  end
  
  def one    
    @product = Product.find_by(id: params["id"])    
    # show is for 1 product
    render template: "products/show"
  end
end
