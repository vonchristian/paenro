class ClientsController < ApplicationController
  def index
  end
  def new
    @client = Client.new
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
    params.require(:client).permit(:first_name, :middle_name, :last_name, :contact_number, :sex)
  end
end
