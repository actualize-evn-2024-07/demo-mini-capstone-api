class ProductsController < ApplicationController
  def index
    @products = Product.all
    # render "products/index"
    render :index
  end
end


# idea 
# syntax
# 
#MVC