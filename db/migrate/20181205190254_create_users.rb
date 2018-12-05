class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :user_type 
      t.string :first_name
      t.string :last_name
      t.string :npi
      t.string :specialty

      t.timestamps
    end
  end
end
