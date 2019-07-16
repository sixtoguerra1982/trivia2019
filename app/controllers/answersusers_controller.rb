class AnswersusersController < ApplicationController
  def create
    @answer = Answer.find(params[:answer_id].to_i)
    @answerbol = @answer.tipo
    @panel = params[:panel].to_i
    @answerscant = params[:answerscant].to_i
    byebug
  end
end
