class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: true
  validates :cocktail, presence: true, uniqueness: { scope: :ingredient, message: "only can one ingredient" }
  validates :ingredient, presence: true
end
