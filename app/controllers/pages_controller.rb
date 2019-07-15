class PagesController < ApplicationController
  def index
    @questions = Question.all
    @answerscant = @questions.count
  end

  def answer_query
    @answer = Answer.find(params[:answer_id].to_i)
    @answerbol = @answer.tipo
    @panel = params[:panel].to_i
    @answerscant = params[:answerscant].to_i
  end
end
