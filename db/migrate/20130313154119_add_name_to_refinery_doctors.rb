class AddNameToRefineryDoctors < ActiveRecord::Migration
  def change
    add_column :refinery_doctors, :name, :string
  end
end
