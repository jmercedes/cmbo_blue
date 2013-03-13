class AddDrImgIdToRefineryDoctors < ActiveRecord::Migration
  def change
    add_column :refinery_doctors, :dr_img_id, :integer
  end
end
