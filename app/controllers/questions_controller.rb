class QuestionsController < ApplicationController
  before_action :authenticate, only: [:create, :update, :delete]

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
    @question.update!(question_params)
    render :show
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    render json: {deleted: true}
  end

  private

  def question_params
    params.require(:question).permit(:title, :body, :tags)
  end

end
