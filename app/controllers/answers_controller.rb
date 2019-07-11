class AnswersController < ApplicationController
  before_action :set_answer, only: [:edit, :update]
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

  private

    def answer_params
      params.require(:answer).permit(:answer, :question_id)
    end

    def set_answer
      @answer = Answer.find(params[:id])
    end

end
