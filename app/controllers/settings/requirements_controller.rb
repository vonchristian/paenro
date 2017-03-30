module Settings
  class RequirementsController < ApplicationController
    def new
      @requirement = Requirement.new
    end
    def create
      @requirement = Requirement.create(requirement_params)
      if @requirement.save
        redirect_to settings_url, notice: "requirement created successfully."
      else
        render :new
      end
    end

    private
    def requirement_params
      params.require(:requirement).permit(:name)
    end
  end
end
