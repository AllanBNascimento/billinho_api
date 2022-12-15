class Student < ApplicationRecord
  require "cpf_cnpj"

  has_many :enrollments, dependent: :destroy

  validates :name, presence: true
  validates :cpf, presence: true, uniqueness: true
  validate :valid_cpf?
  validates :birthdate, 
    timeliness: { before: -> { Date.current }, 
    type: :date}
  validates :payment_method, presence: true, inclusion: { in: %w[credit_card boleto] }

  def valid_cpf?
    errors.add(:cpf, "Invalid CPF number") unless CPF.valid?(cpf)
  end
end

