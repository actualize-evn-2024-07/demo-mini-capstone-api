class OrdersController < ApplicationController
  def index
    @orders = Order.where(user_id: current_user.id)
    render :index
  end
  
  def create
    # find all the carted products in user's shopping cart
    # current_user.carted_products.where(status: "carted")
    @carted_products = CartedProduct.where(status: "carted", user_id: current_user.id)
    # p @carted_products[0].quantity * @carted_products[0].product.price
    # p @carted_products[1].quantity * @carted_products[1].product.price
    # for one cp
      # find quantity
      # find product, and product's price
      # multiply them

    calculated_subtotal = 0
    @carted_products.each do |cp|
      calculated_subtotal += cp.quantity * cp.product.price
    end

    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax


    
    @order = Order.new(
      user_id: current_user.id,
      subtotal: calculated_subtotal.to_s,
      tax: calculated_tax,
      total: calculated_total,      
    )
    @order.save!

    # go back to shopping cart, change the order id and the status
    @carted_products.each do |cp|
      cp.order_id = @order.id
      cp.status = "purchased"
      cp.save
    end
    render :show
  end

  def show
    @order = Order.find_by(id: params[:id])
    if @order.user_id == current_user.id
      render :show
    else
      render json: {}, status: :unauthorized
    end
  end
end
