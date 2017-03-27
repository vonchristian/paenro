class AddHarvestStartDateToHarvests < ActiveRecord::Migration[5.1]
  def change
    add_column :harvests, :harvest_start_date, :datetime
    add_column :harvests, :harvest_end_date, :datetime
    remove_column :harvests, :date_harvested, :datetime

  end
end
