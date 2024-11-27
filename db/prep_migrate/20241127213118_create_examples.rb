class CreateExamples < ActiveRecord::Migration[8.0]
  def change
    create_table :examples do |t|
      t.string :value
      t.timestamps
    end
  end
end