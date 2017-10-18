class VotesController < ApplicationController
  

  def create
    @vote = Vote.new(vote_params)
    if @vote.save
      render status: :created
    else
      render json: {
        errors: @vote.errors
      }, status: :bad_request
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:value)
  end

end
