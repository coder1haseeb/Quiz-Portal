class Api::V1::BlanksController < ActionController::API
  before_action :set_test, :validate_admin

  def index
    @blanks = @test.blanks.all
    @blank = @test.blanks.build
    render json: @blanks
  end

  def create
    @blank = @test.blanks.build(blank_params)
    @blank.test_id = @test.id

    if @blank.save
      render json: @blank, status: :created, location: test_blanks_path(@test)
    elsif !@blank.save
      render json: { error: "Error: The 'blank' field must contain the pattern '__blank__'." }, status: :unprocessable_entity
    else
      render json: @blank.errors, status: :unprocessable_entity
    end
  end

  def edit
    @blank = @test.blanks.find(params[:id])
    render json: @blank
  end

  def update
    @blank = @test.blanks.find(params[:id])
    if @blank.update(blank_params)
      render json: @blank
    elsif !@blank.update(blank_params)
      render json: { error: "Error: The 'blank' field must contain the pattern '__blank__'." }, status: :unprocessable_entity
    else
      render json: @blank.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @blank = @test.blanks.find_by(params[:id])
    @blank.destroy
    head :no_content
  end

  private

  def blank_params
    params.require(:blank).permit(:blank, :correct_blank, :test_id, :marks)
  end

  def set_test
    @test = Test.find(params[:test_id])
  end

  def validate_admin
    unless @test.user_id == current_user.id
      render json: { error: "You are not a valid admin to edit this." }, status: :unauthorized
    end
  end
end
