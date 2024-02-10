class Api::V1::OptionsController < ActionController::API
  before_action :set_test_and_question
  before_action :set_option, only: [:show, :edit, :update, :destroy]

  def index
    @options = @question.options.all
    render json: @options
  end
  def new
    @option = @question.options.build
  end

  def create
    @option = @question.options.build(option_params)
    if @option.save
      render json: { notice: "Option added successfully" }
    elsif !@option.save
      render json: { alert: "The Option key already exists." }
    else
      render json: @option.errors, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @option.update(option_params)
      render json: { notice: "Option updated successfully." }
    else
      render json: @option.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @question.correct_option == @option.option_key
      @question.update(correct_option: "")
    end

    @option.destroy
    render json: { notice: "Option deleted successfully." }
  end

  private

  def set_test_and_question
    @test = Test.find(params[:test_id])
    @question = @test.questions.find(params[:question_id])
  end

  def set_option
    @option = Option.find(params[:id])
  end

  def option_params
    params.require(:option).permit(:option_key, :option_text)
  end
end
