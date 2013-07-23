class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :name
      t.integer :number
      t.references :guide

      t.timestamps
    end
    add_index :steps, :guide_id
  end
end
