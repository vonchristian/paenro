class ProductsController < ApplicationController
  def index
    if params[:search].present?
      @products = Product.text_search(params[:search]).page(params[:page]).per(30)
    else
      @products = Product.all.order(:name).page(params[:page]).per(30)
    end
    respond_to do |format|
        format.html
        format.pdf do
          pdf = Reports::InventoryPdf.new(@products, view_context)
                send_data pdf.render, type: "application/pdf", disposition: 'inline', file_name: "Products Report.pdf"
        end
      end
  end
  def new
    @product = Product.new
  end
  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to @product, notice: "Product created successfully."
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def scope_to_category
    @products = Product.by_category(params[:category]).page(params[:page]).per(50)
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :unit, :category_id)
  end
end
