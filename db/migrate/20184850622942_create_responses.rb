class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.string :response
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :message, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
