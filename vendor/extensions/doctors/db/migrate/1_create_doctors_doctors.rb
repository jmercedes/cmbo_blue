class CreateDoctorsDoctors < ActiveRecord::Migration

  def up
    create_table :refinery_doctors do |t|
      t.string :prefix
      t.string :full_name
      t.text :bio
      t.string :specialty
      t.string :branch
      t.string :schedule
      t.string :location
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-doctors"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/doctors/doctors"})
    end

    drop_table :refinery_doctors

  end

end
