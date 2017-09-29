class UsersController < ApplicationController
  before_action :authenticate, only: [:update]
  # before_action :get_questions

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

  def show
    @user = User.find(params[:id])
    render :show
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

  def logout
  end

  def update
    @user = User.find(params[:id])
    if @user == current_user
      @user.update(user_params)
      if @user.save
        render status: :accepted
      else
        render json: {
          errors: @user.errors
        }, status: :bad_request
      end
    else
      render json: {error: "You are not authorized to update this user"}, status: :unauthorized
    end
  end

  private

  # def get_questions
  #   @user = User.find(params[:id])
  #   @user.questions = Question.where("@user.id = #{params[:id]}")
  # end

  def user_params
    params.require(:user).permit(:username, :password, :avatar, :bio_text, :questions_asked_num, :questions_answered_num, :avatar_big)
  end

end
