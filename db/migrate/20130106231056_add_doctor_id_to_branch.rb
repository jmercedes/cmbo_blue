class AddDoctorIdToBranch < ActiveRecord::Migration
  def change
    add_column :refinery_doctors_branches, :doctor_id, :string
  end
end
