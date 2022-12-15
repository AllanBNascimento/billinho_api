class Enrollment < ApplicationRecord
  belongs_to :student
  
  has_many :bills, dependent: :destroy

  validates :amount, presence: true, numericality: { greater_than: 0 , only_integer: true }
  validates :installments, presence: true, numericality: { greater_than: 1 , only_integer: true }
  validates :due_day, presence: true, numericality: { greater_than: 0, less_than: 32 , only_integer: true }
  after_create :generate_bills

  def generate_bills
    GenerateBills.perform(self)
  end
end
