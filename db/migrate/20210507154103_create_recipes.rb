class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :image
      t.string :description
      t.integer :time
      t.integer :quantity
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
