class AddAmountFieldsToRecipeIngredients < ActiveRecord::Migration[8.1]
  def change
    add_column :recipe_ingredients, :amount_value, :decimal
    add_column :recipe_ingredients, :amount_unit, :string
  end
end
