class MunicipalitiesController < ApplicationController
  def show
    @municipality = Addresses::Municipality.find(params[:id])
  end
end 
