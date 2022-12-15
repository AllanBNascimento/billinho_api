class StudentsController < ApplicationController
  include Paginable

  def index
    @students = Student.page(current_page).per(per_page)
    render json: {
      page: current_page,
      items: @students.as_json(
        except: [:created_at, :updated_at]
      )
    }
  end

  def show
    @student = Student.find(params[:id])
    render json: @student
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      render json: { id:@student.id }, status: :created
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  private

  def student_params
    params.permit(:name, :cpf, :birthdate, :payment_method)
  end
end
