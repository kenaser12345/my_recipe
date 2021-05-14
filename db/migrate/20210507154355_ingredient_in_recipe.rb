class IngredientInRecipe < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients_lists do |t|
      t.references :recipe, foreign_key: true, index: true  
      t.references :ingredient, foreign_key: true, index: true 
      
      t.timestamps
    end
  end
end
