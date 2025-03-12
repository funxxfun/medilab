class Interaction < ApplicationRecord
  belongs_to :medication1, class_name: "Medication"
  belongs_to :medication2, class_name: "Medication"

  validates :severity, presence: true
  validates :description, presence: true

  enum severity: { mild: 0, moderate: 1, severe: 2 }
end
