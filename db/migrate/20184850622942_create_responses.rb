class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.string :response
      t.integer :physician_id
      t.belongs_to :physician, index: true
      t.belongs_to :message, index: true

      t.timestamps null: false
    end
  end
end
