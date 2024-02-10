class QuestionsController < ApplicationController
  before_action :set_question, only: [:edit, :update, :show, :destroy]
  before_action :set_test, only: [:edit, :update, :show, :destroy, :new, :create, :index]
  before_action :validate_creator, only: [:edit, :update, :show, :destroy, :new, :create, :index]

  def index
    @questions = @test.questions.all
    @users = User.normalUsers
    @submits = Submit.where(test_id: @test.id) 
  end
  
  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to edit_test_question_path(@test, @question)
    else
      render "new"
    end
  end
  

  def new
    @question = @test.questions.build
  end

  def show
    @submits = Submit.where(test_id: @test.id) 
  end

  def update
    if @question.update(question_params)
      redirect_to edit_test_question_path(@test, @question) # Use @test to redirect to test's question
    else
      render "edit"
    end
  end

  def edit
  end

  def destroy
    @question.destroy 
    redirect_to test_questions_path(@test), notice: "Question destroyed :("
  end

  private

  def question_params
    params.require(:question).permit(:title, :entered_answer, :correct_option, :test_id , :marks)
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def set_test
    @test = Test.find(params[:test_id])
  end

  def validate_creator
    if @test.user_id != current_user.id
      redirect_to root_path, alert: "You are not the valid author!"
    end
  end

end