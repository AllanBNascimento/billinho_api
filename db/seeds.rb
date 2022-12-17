# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(username: 'admin_ops', password: 'billinho')

Student.create(name: 'Felipe', cpf: '961.772.260-78', birthdate: '15/05/1992', payment_method: 'boleto')
Student.create(name: 'Breno', cpf: '610.340.880-68', birthdate: '10/02/1993', payment_method: 'credit_card')
Student.create(name: 'Guilherme', cpf: '646.050.660-47', birthdate: '29/11/1996', payment_method: 'credit_card')
Student.create(name: 'Carlos', cpf: '419.729.330-51', birthdate: '04/08/1988', payment_method: 'boleto')

Enrollment.create(amount: 1200000, installments: 4, due_day: 5, student_id: 1)
Enrollment.create(amount: 1000000, installments: 3, due_day: 10, student_id: 2)
Enrollment.create(amount: 1500000, installments: 2, due_day: 20, student_id: 3)
Enrollment.create(amount: 2000000, installments: 10, due_day: 31, student_id: 4)
