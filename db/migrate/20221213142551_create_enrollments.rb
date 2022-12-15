class CreateEnrollments < ActiveRecord::Migration[7.0]
  def change
    create_table :enrollments do |t|
      t.integer :amount
      t.integer :installments
      t.integer :due_day
      t.references :student

      t.timestamps
    end
  end
end
