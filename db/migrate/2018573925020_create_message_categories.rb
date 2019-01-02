class CreateMessageCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :message_responses do |t|
      t.belongs_to :message, index: true, foreign_key: true
      t.belongs_to :category, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
