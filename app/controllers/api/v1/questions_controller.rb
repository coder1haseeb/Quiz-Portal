class Api::V1::QuestionsController < ApplicationController
  before_action :set_question, only: [:edit, :update, :show, :destroy]
  before_action :set_test, only: [:edit, :update, :show, :destroy, :new, :create, :index]
  before_action :validate_creator, only: [:edit, :update, :show, :destroy, :new, :create, :index]

  def index
    @questions = @test.questions.all
    @users = User.normalUsers
    @submits = Submit.where(test_id: @test.id)
    render json: @questions ,include: [:options, :submits]
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      render json: @question, status: :created, location: edit_test_question_path(@test, @question)
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  def new
    @question = @test.questions.build
  end

  def show
    render json: @question
  end

  def update
    if @question.update(question_params)
      render json: @question, status: :ok, location: edit_test_question_path(@test, @question)
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  def edit
  end

  def destroy
    @question.destroy
    render json: { notice: "Question destroyed :(" }
  end

  private

  def question_params
    params.require(:question).permit(:title, :entered_answer, :correct_option, :test_id, :marks)
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def set_test
    @test = Test.find(params[:test_id])
  end

  def validate_creator
    unless @test.user_id == current_user.id
      render json: { error: "You are not the valid author!" }, status: :unauthorized
    end
  end
end
