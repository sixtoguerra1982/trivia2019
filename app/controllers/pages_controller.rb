class PagesController < ApplicationController
  def index

     filtro={}
     if user_signed_in?
       sql = 'SELECT u.id AS UDI, u.name, q.id AS QID, q.description, (SELECT x.id FROM answers x INNER JOIN answersusers as au ON au.answer_id = x.id where au.user_id=u.id and x.question_id=q.id ) as RESPUESTA FROM users AS u , questions AS q where UDI=' + current_user.id.to_s + " limit 5"
       filtro = ActiveRecord::Base.connection.execute(sql)
     end

     @filtrados = []
     filtro.each do |f|
       if f['RESPUESTA'].nil?
         @filtrados.push f['QID']
       end
     end

     @answerscant = @filtrados.size


  end

  def ranking
    sql = "Select user_id, count(value) as cantidad from Answersusers where answersusers.value = '1' group by user_id order by cantidad desc limit 3"
    @ranking = ActiveRecord::Base.connection.execute(sql)
  end
end
