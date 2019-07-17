module QuestionsHelper
  def answersOfQuestion(question)
    Answer.where(question_id: question)
  end
  def questionsearch(cuestion_id)
    Question.find(cuestion_id)
  end
end
