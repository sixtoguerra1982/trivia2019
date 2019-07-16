class PagesController < ApplicationController
  def index
    @questions = Question.all
    @answerscant = @questions.count

    sql= 'SELECT questions.id AS Q_ID, questions.description, questions.created_at, questions.updated_at, answers.id AS A_ID, answers.answer, answers.tipo, answers.created_at, answers.updated_at, answersusers.id AS AU_ID, answersusers.value, answersusers.created_at, answersusers.updated_at, users.email, users.encrypted_password, users.reset_password_token, users.reset_password_sent_at, users.remember_created_at, users.created_at, users.updated_at, users.name, users.role, users.id AS U_ID FROM questions LEFT JOIN answers ON answers.question_id = questions.id LEFT JOIN answersusers ON answersusers.answer_id = answers.id LEFT JOIN users ON answersusers.user_id = users.id where au_id is NULL'
    @ranking = ActiveRecord::Base.connection.execute(sql)
  end

  def ranking
    sql = "Select user_id, count(value) as cantidad from Answersusers where answersusers.value = '1' group by user_id order by cantidad desc limit 3"
    @ranking = ActiveRecord::Base.connection.execute(sql)
    byebug
  end
end
