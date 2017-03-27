class ClientsController < ApplicationController
  def index
    if params[:search].present?
      @clients = Client.text_search(params[:search]).page(params[:page]).per(10)
    else
      @clients = Client.all.order(:last_name).page(params[:page]).per(30)
    end
  end
  def new
    @client = Client.new
    @client.addresses.build
    @client.farms.build
  end
  def create
    @client = Client.create(client_params)
    if @client.save
      redirect_to @client, notice: "Client saved successfully."
    else
      render :new
    end
  end
  def show
    @client = Client.find(params[:id])
    @requirement = @client.client_requirements.build
  end
  def edit
    @client = Client.find(params[:id])
  end
  def update
    @client = Client.find(params[:id])
    @client.update_attributes(client_params)
    if @client.save
      redirect_to @client, notice: "Client updated successfully"
    else
      render :edit
    end
  end

  private
  def client_params
    params.require(:client).permit(:first_name, :middle_name, :last_name, :contact_number, :sex, :program_id, addresses_attributes: [:id, :sitio, :barangay_id, :municipality_id], farms_attributes: [:id, :area, :suitable, :cleared])
  end
end
