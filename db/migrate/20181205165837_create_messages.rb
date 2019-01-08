class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :title
      t.string :question
      t.integer :patient_id
      t.belongs_to :patient, index: true

      t.timestamps
    end
  end
end
