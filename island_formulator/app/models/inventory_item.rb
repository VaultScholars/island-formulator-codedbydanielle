class InventoryItem < ApplicationRecord
  belongs_to :user
  belongs_to :ingredient
  has_one_attached :photo # Optional: take a photo of the receipt or bottle!

  validates :ingredient_id, presence: true
  validates :purchase_date, presence: true

  validates :cost, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :unit_size, numericality: { greater_than: 0 }, allow_nil: true
  validates :unit, presence: true

  def cost_per_unit
    return nil if cost.blank? || unit_size.blank? || unit_size.to_f.zero?
    cost.to_f / unit_size.to_f
  end
end
