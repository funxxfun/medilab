class PrescriptionItem < ApplicationRecord
  belongs_to :prescription
  belongs_to :medication

  validates :dosage, presence: true
  validates :instruction, presence: true
end
