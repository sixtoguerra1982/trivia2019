class AnswersController < ApplicationController
  before_action :set_answer, only: [:edit, :update, :destroy]
  before_action :set_questions, only: [:new, :index_answers]
  def index_answers
    @answers = Answer.order(:question_id)
    @question = @questions.first
  end

  def index
    @answers = Answer.where(question_id: params[:question_id])
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  def new
    @answer = Answer.new
    @question = @questions.first
  end
  def create
    @limit_answers = 5
    @answer = Answer.new(answer_params)
    respond_to do |format|
      @answers = Answer.where(question_id: @answer.question_id)
      if @answers.count < @limit_answers
        if @answer.save
          format.html { redirect_to answers_index_answers_path , notice: 'Answer was successfully created.' }
        else
          format.html { render :new }
          format.json { render json: @answer.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to answers_index_answers_path , alert: 'The maximum number of responses has been exceeded' }
      end
    end
  end

  def edit
    @question = Question.find(params[:question_id])
  end

  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to answers_index_answers_path, notice: 'Answer was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_index_answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

    def answer_params
      params.require(:answer).permit(:answer, :question_id)
    end

    def set_answer
      @answer = Answer.find(params[:id])
    end

    def set_questions
      @questions = Question.all
    end

end
