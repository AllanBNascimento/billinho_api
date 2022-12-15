class EnrollmentSerializer < ActiveModel::Serializer
  attributes :id, :student_id, :amount, :installments, :due_day
end
