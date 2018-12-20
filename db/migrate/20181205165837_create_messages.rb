class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :title
      t.string :body
      t.string :response
      t.integer :user_id

      t.timestamps
    end
  end
end
