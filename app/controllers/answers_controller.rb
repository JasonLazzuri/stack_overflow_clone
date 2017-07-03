class AnswersController < ApplicationController

  before_action :authorize, only: [:new, :create]

  def secret
  end

  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    @answer.user_id = current_user.id
    if @answer.save
      redirect_to question_answers_path(@question)
    else
      render :new
    end
  end

  def edit
  end

  def show
    @answer = Answer.find(params[:id])
    @user = User.find(@answer.user_id)
  end
end


private
  def answer_params
    params.require(:answer).permit(:body)
end
