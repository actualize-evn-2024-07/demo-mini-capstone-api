class OrdersController < ApplicationController
  def create
    # make a new order
    # 
    order = Order.new(
      user_id: params[:user_id],
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: params[:subtotal],
      tax: params[:tax],
      total: params[:total],
    )
    order.save
    render json: {message:" hello"}
  end

  def show
    @order = Order.find_by(id: params[:id])
    render :show
  end
end
