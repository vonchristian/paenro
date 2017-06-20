class WarehouseController < ApplicationController
  def index
    if params[:search].present?
      @stocks = Products::Stock.text_search(params[:search]).all.to_a.sort_by(&:date)
    else
      @stocks = Products::Stock.all.page(params[:page]).per(10)
    end
    @cart = current_cart
    @line_item = Orders::LineItem.new
  end
end
