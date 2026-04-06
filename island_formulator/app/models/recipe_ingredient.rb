class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  validates :quantity, presence: true
  validates :amount_value, numericality: { greater_than: 0 }, allow_nil: true

  def matching_inventory_item
    ingredient.inventory_items
              .where(user_id: recipe.user_id, unit: amount_unit)
              .order(purchase_date: :desc)
              .first
  end

  def estimated_cost
    item = matching_inventory_item
    return nil if item.nil? || amount_value.blank? || item.cost_per_unit.nil?

    amount_value.to_f * item.cost_per_unit
  end
end