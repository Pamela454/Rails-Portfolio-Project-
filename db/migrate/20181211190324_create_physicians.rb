class CreatePhysicians < ActiveRecord::Migration[5.2]
  def change
    create_table :physicians do |t|
      t.integer :npi
      t.string :specialty
    end
  end
end
