module Settings
  class MunicipalitiesController < ApplicationController
    def new
      @municipality = Addresses::Municipality.new
    end
    def create
      @municipality = Addresses::Municipality.create(municipality_params)
      if @municipality.save
        redirect_to municipality_url(@municipality), notice: "Municipality created successfully."
      else
        render :new
      end
    end

    private
    def municipality_params
      params.require(:addresses_municipality).permit(:name)
    end
  end
end
