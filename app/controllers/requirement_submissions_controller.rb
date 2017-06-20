class RequirementSubmissionsController < ApplicationController
  def create
    @client_requirement = Clients::ClientRequirement.create(client_requirement_params)
    @client_requirement.save
    redirect_to client_url(@client_requirement.client), notice: "Requirement submitted successfully."
  end
  private
  def client_requirement_params
    params.require(:clients_client_requirement).permit(:requirement_id, :client_id)
  end
end
