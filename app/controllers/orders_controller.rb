class OrdersController < ApplicationController
  def create
    # make a new order
    # 
    p current_user
    render json: {message:" hello"}
  end
end
