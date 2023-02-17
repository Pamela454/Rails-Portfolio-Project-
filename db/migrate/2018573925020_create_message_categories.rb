class CreateMessageCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :message_categories do |t|
      t.belongs_to :message, index: true
      t.belongs_to :category, index: true
      t.timestamps null: false
    end
  end
end
