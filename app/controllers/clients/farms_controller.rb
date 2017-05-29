module Clients
  class FarmsController < ApplicationController
    def new
      @client = Client.find(params[:client_id])
      @farm = @client.farms.build
    end
    def create
      @client = Client.find(params[:client_id])
      @farm = @client.farms.create(farm_params)
      if @farm.save
        redirect_to client_url(@client), notice: "Farm saved successfully."
      else
        render :new
      end
    end

    private
    def farm_params
      params.require(:clients_farm).permit(:area, :suitable, :cleared)
    end
  end
end
