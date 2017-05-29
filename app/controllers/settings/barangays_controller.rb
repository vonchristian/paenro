module Settings
  class BarangaysController < ApplicationController
    def new
      @municipality = Addresses::Municipality.find(params[:municipality_id])
      @barangay = @municipality.barangays.build
    end
    def create
      @municipality = Addresses::Municipality.find(params[:municipality_id])
      @barangay = @municipality.barangays.create(barangay_params)
      if @barangay.save
        redirect_to municipality_url(@municipality), notice: "Barangay created successfully"
      else
        render :new
      end
    end

    private
    def barangay_params
      params.require(:addresses_barangay).permit(:name)
    end
  end
end
