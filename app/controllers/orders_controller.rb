class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.add_line_items_from_cart(current_cart)
    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to warehouse_index_url, notice: 'Client order saved successfully.'
    else
      @cart = current_cart
    end
  end

  private
  def order_params
    params.require(:order).permit(:client_id, :date)
  end
end 
