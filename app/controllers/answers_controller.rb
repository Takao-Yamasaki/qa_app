class AnswersController < ApplicationController
  def new
    answer = Answer.new(answer_params)
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new
    if @answer.update!(answer_params)
      redirect_to question_path(@question), notice: '回答を投稿しました'
    else
      redirect_to question_path(@question), notice: '回答できませんでした'
    end
  end

  def destroy
    answer = Answers.find(params[:question_id])
    answer.destroy
  end

  def index
    @answers = Answers.all
  end

  private

  def answer_params
    params.require(:answer).permit(:user_id, :question_id, :description)
  end
end
