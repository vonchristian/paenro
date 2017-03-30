class FarmsController < ApplicationController
  def index
    if params[:search].present?
      @farms = Clients::Farm.text_search(params[:search]).page(params[:page]).per(10)
    else
      @farms = Clients::Farm.all.order(:name).page(params[:page]).per(30)
    end
  end

  def show
    @farm = Clients::Farm.find(params[:id])
  end
end
