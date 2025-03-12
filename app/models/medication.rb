class Medication < ApplicationRecord
  has_many :prescription_items
  has_many :prescriptions, through: :prescription_items

  validates :name, presence: true
  validates :dosage, presence: true

  def display_name
    "#{name} (#{dosage_from})"
  end
end
