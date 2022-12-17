class EnrollmentSerializer < ActiveModel::Serializer
  attributes  :id, 
              :student_id, 
              :amount, 
              :installments, 
              :due_day
  
  has_many :bills, key: :bills, serializer: BillSerializer
end
