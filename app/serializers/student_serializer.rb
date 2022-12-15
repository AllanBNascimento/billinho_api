class StudentSerializer < ActiveModel::Serializer
  attributes :id, :name, :cpf, :birthdate, :payment_method
end
