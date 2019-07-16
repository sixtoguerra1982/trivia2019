class PagesController < ApplicationController
  def index
    @questions = Question.all
    @answerscant = @questions.count
  end

  def answer_query
  
    Answersusers.create
  end
end
