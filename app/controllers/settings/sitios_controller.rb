module Settings
  class SitiosController < ApplicationController
    def new
      @barangay = Addresses::Barangay.find(params[:barangay_id])
      @sitio = @barangay.sitios.build
    end
    def create
      @barangay = Addresses::Barangay.find(params[:barangay_id])
      @sitio = @barangay.sitios.create(sitio_params)
      if @barangay.save
        redirect_to barangay_url(@barangay), notice: "Sitio created successfully"
      else
        render :new
      end
    end

    private
    def sitio_params
      params.require(:addresses_sitio).permit(:name)
    end
  end
end
