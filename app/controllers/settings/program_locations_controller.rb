module Settings
  class ProgramLocationsController < ApplicationController
    def edit
      @program_location = Programs::ProgramLocation.find(params[:id])
    end
    def update
      @program_location = Programs::ProgramLocation.find(params[:id])
      @program_location.update_attributes(program_location_params)
      if @program_location.save
        redirect_to settings_url, notice: 'Program Location saved successfully.'
      else
        render :edit
      end
    end

    private
    def program_location_params
      params.require(:programs_program_location).permit(:target_area, :beneficiary_count )
    end
  end
end
