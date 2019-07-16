class AnswersusersController < ApplicationController
  def create
    @answer = Answer.find(params[:answer_id].to_i)
    @answerbol = @answer.tipo
    @panel = params[:panel].to_i
    @answerscant = params[:answerscant].to_i

    @answersuser = Answersuser.new
    @answersuser.user = current_user
    @answersuser.answer = @answer
    @answersuser.value = @answer.tipo
    @answersuser.save
  end
end
