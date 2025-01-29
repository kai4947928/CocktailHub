# frozen_string_literal: true

class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  validates :quantity, presence: true, if: :quantity_present?

  def quantity_present?
    quantity.present?
  end
end
