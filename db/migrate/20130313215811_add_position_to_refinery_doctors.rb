class AddPositionToRefineryDoctors < ActiveRecord::Migration
  def change
    add_column :refinery_doctors, :position, :integer
  end
end
