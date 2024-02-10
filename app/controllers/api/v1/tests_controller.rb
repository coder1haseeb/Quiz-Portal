class Api::V1::TestsController < ActionController::API
  before_action :set_test, :validate_admin, only: [:edit, :update, :show, :destroy]

  def index
    @tests = current_user.tests.all.order("created_at")
    @assignments = current_user.assignments.all.order("created_at")
    render json: @tests, include: {
      questions: {
        include: [:options, :submits]
      },
      blanks: {
        include: :submits
      },
      truefalse: {
        include: :submits
      }
    }
    
  end

  def create
    @test = current_user.tests.build(test_params)

    if @test.save
      render json: @test, status: :created, location: test_questions_path(@test)
    else
      render json: @test.errors, status: :unprocessable_entity
    end
  end

  def show  
    render json: @test
  end

  def new
    @test = Test.new
  end

  def destroy
    @test.destroy
    render json: { notice: "Test deleted successfully." }
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
      render json: { error: "You are not a valid admin to edit this." }, status: :unauthorized
    end
  end  
end
