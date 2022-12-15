class Bill < ApplicationRecord
  belongs_to :enrollment

  validates :amount, presence: true, numericality: { greater_than: 0 , only_integer: true }
  validates :due_date, presence: true, timeliness: { type: :date }
  validates :status, presence: true, inclusion: { in: %w[open pending paid] }

end
