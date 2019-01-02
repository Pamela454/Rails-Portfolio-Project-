class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :type
      t.string :name
      t.string :npi
      t.string :specialty
      t.integer :uid

      t.timestamps
    end
  end
end
