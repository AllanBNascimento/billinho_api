class GenerateBills
  include UseCase

  attr_reader :enrollment

  def initialize (enrollment)
      @enrollment = enrollment
  end

  def perform
    calculate_first_due_date_to_date
    calculate_bill_amount
    calculate_remainder_value
    create_bills
  end

  private

  def calculate_first_due_date_to_date
    return mount_next_month_date if in_past?
    return mount_end_of_month_date if end_of_month?
    mount_month_date
  end

  def in_past?
    enrollment.due_day < Date.today.day
  end

  def end_of_month?
    enrollment.due_day >= Date.today.end_of_month.day
  end

  def mount_next_month_date
    @first_due_date = (enrollment.due_day.to_s + Date.today.strftime('/%m/%Y')).to_date.next_month
  end

  def mount_end_of_month_date
    @first_due_date = Date.today.end_of_month
  end

  def mount_month_date
    @first_due_date = (enrollment.due_day.to_s + Date.today.strftime('/%m/%Y')).to_date
  end

  def calculate_bill_amount
    @amount = enrollment.amount / enrollment.installments
  end

  def calculate_remainder_value
    @remainder = enrollment.amount - (enrollment.installments * @amount)
  end

  def create_bills
    @enrollment.installments.times do |installment|
      bill_amount = installment < @remainder ? @amount + 1 : @amount
      due_date = @first_due_date.next_month(installment)
      create_bill(bill_amount, due_date)
    end
  end

  def create_bill(bill_amount, due_date)
    Bill.create!(
      amount: bill_amount, 
      due_date: due_date, 
      status:'open', 
      enrollment_id:enrollment.id
    )
  end
end