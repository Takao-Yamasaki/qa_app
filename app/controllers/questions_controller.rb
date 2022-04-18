class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(questions_params)
    @question.save!
    redirect_to questions_url, notice: "質問を作成しました。"
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    question = Question.find(params[:id])
    question.update!(questions_params)
    redirect_to questions_url, notice: "質問を更新しました。"
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to questions_url, notice: '質問を削除しました。'
  end

  private

  def questions_params
    params.require(:question).permit(:title, :description)
  end
end
