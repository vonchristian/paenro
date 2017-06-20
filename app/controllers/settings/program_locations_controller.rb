module Settings
  class ProgramLocationsController < ApplicationController
    def new
      @program = Program.find(params[:program_id])
      @location = @program.program_locations.build
    end
    def create
      @program = Program.find(params[:program_id])
      @location = @program.program_locations.create(program_location_params)
      if @location.save
        redirect_to settings_url, notice: "Program Location saved successfully."
      else
        render :new
      end
    end

    def edit
      @program_location = Programs::ProgramLocation.find(params[:id])
    end
    def update
      @program_location = Programs::ProgramLocation.find(params[:id])
      @program_location.update_attributes(program_location_params)
      if @program_location.save
        redirect_to @program_location.program, notice: 'Program Location saved successfully.'
      else
        render :edit
      end
    end

    private
    def program_location_params
      params.require(:programs_program_location).permit(:barangay_id, :target_area, :beneficiary_count )
    end
  end
end
