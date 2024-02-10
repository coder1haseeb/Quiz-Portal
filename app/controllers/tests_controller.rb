class TestsController < ApplicationController
  before_action :set_test, :validate_admin, only: [:edit, :update, :show, :destroy]
  def index
    @tests = current_user.tests.all.order("created_at")
    @assignments = current_user.assignments.all.order("created_at")
  end
  
  def create
    @test = current_user.tests.build(test_params)
    
    if @test.save
      redirect_to test_path(@test)
    else
      render "new"
    end
  end
  
  def show  
    @test = Test.find(params[:id])
    test_questions_count = @test.questions.count
    test_blanks_count = @test.blanks.count
    test_truefalse_count = @test.truefalse.count
    @test_all_enteries = test_questions_count + test_blanks_count + test_truefalse_count
  end

  def new
    @test = Test.new
  end

  def destroy
    @test = Test.find(params[:id])
    @test.destroy
    redirect_to tests_path , notice: "Test deleted successfully."
  end

  private

  def test_params
    params.require(:test).permit(:name)
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def validate_admin
    unless @test.user_id == current_user.id
      redirect_to root_path, alert: "You are not a valid admin to edit this."
    end
  end  
end