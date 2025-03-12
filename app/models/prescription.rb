class Prescription < ApplicationRecord
  belongs_to :patient
  has_many :prescription_items, dependent: :destroy
  has_many :medications, through: :prescription_items

  validates :issue_date, presence: true

  def total_medications
    medications.count
  end

  def formatted_issue_date
    issue_date.strftime("%Y年%m月%d日")
  end
end
