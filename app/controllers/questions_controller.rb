class QuestionsController < ApplicationController
  def index
    @q = current_user.questions.ransack(params[:q])
    @questions = @q.result(distinct: true).page(params[:page])
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(questions_params)
    if @question.save
      redirect_to questions_url, notice: "質問を作成しました。" 
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
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

  def solve
    @question = Question.find(params[:id])
    @question.resolved = true
    @question.save!
    redirect_to question_url(@question), notice: '解決済みになりました。'
  end

  def unsolved
    @q = current_user.questions.where(resolved: false).ransack(params[:q])
    @questions = @q.result(distinct: true).page(params[:page])
  end

  def solved
    @q = current_user.questions.where(resolved: true).ransack(params[:q])
    @questions = @q.result(distinct: true).page(params[:page])
  end

  private

  def questions_params
    params.require(:question).permit(:title, :description, :resolved)
  end
end
