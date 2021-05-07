class CreateSteps < ActiveRecord::Migration[6.1]
  def change
    create_table :steps do |t|
      t.string :image
      t.text :description
      t.integer :sequence
      t.references :recipe, foreign_key: true, index: true 
      t.timestamps
    end
  end
end
