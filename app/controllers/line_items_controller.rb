class LineItemsController < ApplicationController
  def create
    @cart = current_cart
    @line_item = @cart.line_items.create(line_item_params)
    if @line_item.save
      @cart.add_line_item(@line_item)
      redirect_to warehouse_index_url, notice: "Added successfully"
    else
      redirect_to warehouse_index_url, alert: 'Error'
    end
  end

  def destroy
    @line_item = Orders::LineItem.find(params[:id])
    @line_item.destroy
    redirect_to warehouse_index_url
  end

  private
  def line_item_params
    params.require(:orders_line_item).permit(:stock_id, :quantity)
  end
end
