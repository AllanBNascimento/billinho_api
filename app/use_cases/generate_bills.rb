class GenerateBills
  include UseCase

  attr_reader :enrollment

  def initialize (enrollment)
      @enrollment = enrollment
  end

  def perform
    first_due_date = calculate_first_due_date_to_date
    amount, remainder = calculate_amounts
    create_bills(first_due_date, amount, remainder)
  end

  private

  def calculate_first_due_date_to_date
    if enrollment.due_day < Date.today.day
      (enrollment.due_day.to_s + Date.today.next_month.strftime('/%m/%Y')).to_date
    elsif enrollment.due_day >= Date.today.end_of_month.day
      Date.today.end_of_month
    else
      (enrollment.due_day.to_s + Date.today.strftime('/%m/%Y')).to_date
    end
  end

  def calculate_amounts
    amount = enrollment.amount / enrollment.installments
    remainder = enrollment.amount - (enrollment.installments * amount)
    return amount, remainder
  end

  def create_bills(first_due_date, amount, remainder)
    remaning = 1
    for k in 0..@enrollment.installments-1 do
      if remainder > 0
        remainder -= 1 
      else
        remaning = 0
      end
      Bill.create!(
        amount: amount + remaning, 
        due_date: first_due_date.next_month(k), 
        status:'open', 
        enrollment_id:enrollment.id
      )
    end
  end
end