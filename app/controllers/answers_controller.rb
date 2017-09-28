class AnswersController < ApplicationController
  before_action :authenticate
  before_action :get_question

  def create
    @answer = @question.answers.build(answer_params)
    @answer.user = current_user

    if @answer.save
      render status: :created
    else
      render json: {
        errors: @answer.errors
      }, status: :bad_request
    end
  end

  def destroy
    @answer = @question.answers.find(params[:id])
    if @answer.user == current_user
      @answer.destroy
      render json: {deleted: true}
    else
      render json: {error: "You are not authorized to delete this answer"}, status: :unauthorized
    end
  end

  private

  def get_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:body, :code)
  end
end
