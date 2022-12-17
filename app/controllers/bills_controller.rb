class BillsController < ApplicationController
  include Paginable

  def index
    @bills = Bill.page(current_page).per(per_page)
    render json: {
      page: current_page,
      items: @bills.as_json(
        except: [:created_at, :updated_at]
      )
    }
  end

  def show
    @bill = Bill.find(params[:id])
    render json: @bill
  end

  def create
    @bill = bill.new(bill_params)
    if @bill.save
      render json: @bill, status: :created
    else
      render json: @bill, status: :unprocessable_entity
    end
  end

  private

  def bill_params
    params.require(:bill).permit(:amount, :due_date, :enrollment_id, :status)
  end
end
