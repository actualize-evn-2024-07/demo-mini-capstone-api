class ProductsController < ApplicationController
  def index    
    @products = Product.all
    @suppliers = Supplier.all
    # render "products/index"
    render :index
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      supplier_id: params[:supplier_id]
    )
    # happy/sad path
    if @product.save
      params[:image_urls].each do |url|
        image = Image.new(
          url: url,
          product_id: @product.id
        )
        image.save
      end
      render :show
    else
      # error handling      # 
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    # get the right id    
    @product = Product.find_by(id: params[:id])
    # find the product with that id
    render :show
  end

  def update
    # find the correct product
    @product = Product.find_by(id: params[:id])
    # modify attributes
    # 
    # what should i do if the param is nil? I want to not update that value
    @product.update(
      name: params[:name] || @product.name,
      price: params[:price] || @product.price,      
      description: params[:description] || @product.description,
    )
    render :show
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: {message: "product has been removed"}
  end
end


# idea 
# syntax
# 
#MVC