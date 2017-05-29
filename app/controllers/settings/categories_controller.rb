module Settings
  class CategoriesController < ApplicationController
    def new
      @category = Category.new
    end
    def create
      @category = Category.create(category_params)
      if @category.save
        redirect_to settings_url, notice: "Category created successfully."
      else
        render :new
      end
    end

    private
    def category_params
      params.require(:category).permit(:name)
    end
  end
end
