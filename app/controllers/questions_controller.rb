class QuestionsController < ApplicationController

  before_action :authorize, only: [:new, :create, :show]

  def secret
  end

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
    @user = current_user
  end

  def create
   @user = current_user
   @question = Question.new(question_params)
   @question.user_id = @user.id
   if @question.save
     redirect_to  question_path(@question)
   else
     render :new
   end
 end

  def edit
  end

  def show
    @question = Question.find(params[:id])
    @user = User.find(@question.user_id)
    @answers = @question.answers.all
  end
end

private
  def question_params
    params.require(:question).permit(:title,:content)
end
