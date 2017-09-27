class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      render status: :created
    else
      render json: {
        errors: @user.errors
      }, status: :bad_request
    end
  end

  def login
    user = User.find_by(username: params[:username]).try(:authenticate, params[:password])

    if !user
      render status: :unauthorized, json: {
        "error": "There is no user with that email and password"
      }
    else
      render json: {token: user.token}
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      render status: :accepted
    else
      render json: {
        errors: @user.errors
      }, status: :bad_request
    end

  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :avatar, :bio_text, :questions_asked_num, :questions_answered_num)
  end

end
