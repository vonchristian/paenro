module Settings
  class ProgramsController < ApplicationController
    def new
      @program = Program.new
      @program.program_locations.build
    end
    def create
      @program = Program.create(program_params)
      if @program.save!
        redirect_to settings_url, notice: "program created successfully."
      else
        render :new
      end
    end

    private
    def program_params
      params.require(:program).permit(:name, program_locations_attributes: [:barangay_id])
    end
  end
end
