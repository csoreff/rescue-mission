class AnswersController < ApplicationController
  def index
      @question = Question.find(params[:question_id])
      @answers = @question.answers
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question
    @answer.user = current_user
    if @answer.save
      flash[:notice] = 'Answer added.'
      redirect_to question_path(@question)
    else
      redirect_to question_path(@question)
    end
  end

  protected
  def answer_params
      params.require(:answer).permit(:answer)
  end
end
