class UsersController < ApplicationController
  include Paginable

  def index
    @user = User.page(current_page).per(per_page)
    render json: {
      page: current_page,
      items: @user.as_json(
        except: [:created_at, :updated_at]
      )
    }
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      render json: {user: @user}, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by(username: user_params[:username])

    if @user && @user.authenticate(user_params[:password])
      token = encode_token({user_id: @user.id})
      response.set_header('Token', token)
      render json: {user: @user}, status: :ok
    else
      render json: { error_message: 'Invalid username or password!' }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:username, :password)
  end 
end
