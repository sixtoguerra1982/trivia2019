module QuestionsHelper
  def answersOfQuestion(question)
    Answer.where(question_id: question)
  end
end
