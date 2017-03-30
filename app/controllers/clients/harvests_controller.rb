module Clients
  class HarvestsController < ApplicationController
    def new
      @farm = Clients::Farm.find(params[:farm_id])
      @harvest = @farm.harvests.build
    end
    def create
      @farm = Clients::Farm.find(params[:farm_id])
      @harvest = @farm.harvests.create(harvest_params)
      if @harvest.save
        redirect_to farm_url(@farm), notice: "Harvest saved successfully."
      else
        render :new
      end
    end

    private
    def harvest_params
      params.require(:clients_harvest).permit(:weight, :gross_income, :date_harvested)
    end
  end
end
