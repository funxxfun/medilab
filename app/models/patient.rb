class Patient < ApplicationRecord
  has_many :prescriptions
  has_many :medication, through: :prrescriptions

  validates :name, presence: true
  validates :age, numericality: { only_integer: true, greater_than: 0 }
  validates :insurance_number, presence: true, uniqueness: true

  def full_details
    "#{name} (#{age}歳) 保険番号： #{insurance_number}"
  end
end
