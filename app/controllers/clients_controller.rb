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
  end

  private
  def client_params
    params.require(:client).permit(:first_name, :middle_name, :last_name, :contact_number, :sex, addresses_attributes: [:sitio_id, :barangay_id, :municipality_id])
  end
end
