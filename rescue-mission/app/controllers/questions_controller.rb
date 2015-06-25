class QuestionsController < ApplicationController
  def index
    @questions = Question.order(created_at: :desc)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = 'Question added.'
      redirect_to '/questions'
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @answers = Answer.all
    @answer = Answer.new
  end

  def destroy
  end

  protected
  def question_params
    params.require(:question).permit(:title, :description)
  end
end
