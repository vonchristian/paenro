module Settings
  class CropsController < ApplicationController
    def new
      @crop = Crop.new
    end
    def create
      @crop = Crop.create(crop_params)
      if @crop.save
        redirect_to settings_url, notice: "Crop created successfully."
      else
        render :new
      end
    end

    private
    def crop_params
      params.require(:crop).permit(:name)
    end
  end
end
