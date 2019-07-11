class AnswersController < ApplicationController
  before_action :set_answer, only: [:edit, :update, :destroy]
  before_action :set_questions, only: [:new, :edit]
  def index
    @answers = Answer.all
  end
  def new
    @answer = Answer.new
  end
  def create
    @answer = Answer.new(answer_params)
    respond_to do |format|
      if @answer.save
        format.html { redirect_to answers_path , notice: 'Answer was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to answers_path, notice: 'Answer was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
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
