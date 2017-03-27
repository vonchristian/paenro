module Settings
  class ProgramGrantsController < ApplicationController
    def new
      @program = Program.find(params[:program_id])
    end
    def create
      @program = Program.find(params[:program_id])
      @program_grant = @program.program_grants.create(program_grant_params)
      if @program_grant.save
        redirect_to new_settings_program_program_grant_path(@program), notice: "Program Grant added successfully."
      else
        render :new
      end
    end

    private
    def program_grant_params
      params.require(:programs_program_grant).permit(:product_id, :quantity)
    end
  end
end
