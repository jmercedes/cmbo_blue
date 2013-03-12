class AddDrImgToRefineryDoctors < ActiveRecord::Migration
  def change
    add_column :refinery_doctors, :dr_img, :string
  end
end
