class EnrollmentsController < ApplicationController
  include Paginable

  before_action :authorize, only: [:create]

  def index
    @enrollments = Enrollment.page(current_page).per(per_page)
    render json: {
      page: current_page,
      items: @enrollments.as_json(
        :except => [:created_at, :updated_at],
        :include => {
          :bills => {
            :except => [:created_at, :updated_at, :enrollment_id]
          }
        } 
      )
    }
  end

  def show
    @enrollment = Enrollment.find(params[:id])
    render json: @enrollment
  end

  def new
    @enrollment = Enrollment.new
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)
    if @enrollment.save
      render json: @enrollment.to_json(
        :except => [:created_at, :updated_at],
        :include => { 
          :bills => { 
            :except => [:created_at, :updated_at, :enrollment_id]
          }
        }
      ), status: :created
    else
      render json: { data: @enrollment.errors }, status: :unprocessable_entity
    end
  end

  private

  def enrollment_params
    params.permit(:amount, :installments, :due_day, :student_id)
  end
end
