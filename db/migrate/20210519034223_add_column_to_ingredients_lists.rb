class AddColumnToIngredientsLists < ActiveRecord::Migration[6.1]
  def change
    add_column :ingredients_lists, :amount, :string
  end
end
