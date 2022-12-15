class BillSerializer < ActiveModel::Serializer
  attributes :id, :enrollment_id, :due_date, :status, :amount
end
