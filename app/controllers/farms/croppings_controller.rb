module Farms
  class CroppingsController < ApplicationController
    def new
      @farm = Clients::Farm.find(params[:farm_id])
      @cropping = @farm.croppings.build
    end
    def create
      @farm = Clients::Farm.find(params[:farm_id])
      @cropping = @farm.croppings.create(cropping_params)
      if @cropping.save
        redirect_to farm_url(@farm), notice: "Crop saved successfully."
      else
        render :new
      end
    end

    private
    def cropping_params
      params.require(:farms_cropping).permit(:crop_id)
    end
  end
end
