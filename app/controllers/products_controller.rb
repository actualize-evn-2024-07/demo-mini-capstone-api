class ProductsController < ApplicationController
  def index
    @products = Product.all
    # render "products/index"
    render :index
  end

  def create
    @product = Product.new(
      name: "television",
      price: 600,
      image_url: "https://media.istockphoto.com/id/1395191574/photo/black-led-tv-television-screen-blank-isolated.jpg?s=612x612&w=0&k=20&c=ps14JZJh0ebkINcbQyHFsR1J5EC7ozkj_WO7Fh_9IOI=",
      description: "shows images from tv channels"
    )
    @product.save
    render :show
  end
end


# idea 
# syntax
# 
#MVC