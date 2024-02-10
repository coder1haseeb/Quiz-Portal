class OptionsController < ApplicationController
  before_action :set_test_and_question 
  before_action :set_option, only: [:show, :edit, :update, :destroy]

  def new
    @option = @question.options.build
  end

  def create
    @option = @question.options.build(option_params)
    @existing_text = @question.options.find_by(option_text: @option.option_text)
    if @existing_text
      redirect_to edit_test_question_path(@test , @question), alert: "Option text already exists."
    else
      if @option.save
        redirect_to edit_test_question_path(@test, @question), notice: "Option added successfully"
      elsif !@option.save
        redirect_to edit_test_question_path(@test, @question), alert:"The Option key already exists."
      else
        render "new"
      end
    end
  end

  def edit
    
  end

  def update
    if @option.update(option_params)
      redirect_to edit_test_question_path(@test, @question) , notice: "Option updated successfully."
    else
      render "edit"
    end
  end

  def destroy
    if @question.correct_option == @option.option_key
      @question.update(correct_option: "") 
    end
    
    @option.destroy
    redirect_to edit_test_question_path(@test, @question), notice: "Option deleted Successfully."
    return
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
