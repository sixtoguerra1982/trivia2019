class PagesController < ApplicationController
  def index
    @questions = Question.all
    @answerscant = @questions.count
  end
end
