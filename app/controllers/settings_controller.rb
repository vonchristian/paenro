class SettingsController < ApplicationController
  def index
    @municipalities = Addresses::Municipality.all.order(:name)
  end
end
