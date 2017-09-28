class QuestionsController < ApplicationController
  before_action :authenticate, only: [:create, :update, :destroy]

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.create(question_params)
    render :show, status: :created
  end

  def update
    @question = Question.find(params[:id])
    if @question.user == current_user
      @question.update!(question_params)
      render :show
    else
      render json: {error: "You are not authorized to update this question"}, status: :unauthorized
    end
  end

  def destroy
    @question = Question.find(params[:id])
    if @question.user == current_user
      @question.destroy
      render json: {deleted: true}
    else
      render json: {error: "You are not authorized to delete this question"}, status: :unauthorized
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body, :tags)
  end

end
