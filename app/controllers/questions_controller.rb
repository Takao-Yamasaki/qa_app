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
  end

  def edit
  end

  def destroy
  end

  private

  def questions_params
    params.require(:question).permit(:title, :description)
  end
end
