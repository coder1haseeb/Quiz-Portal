class SavedanswersController < ApplicationController
  def create
    @test = Test.find(params[:test_id])
    @retake = @test.retakes.find_by(params[:id])
    if @retake
      @submits = Submit.where(user_id: @retake.user_id, test_id: @test.id)
      @submits.each do |submit|
        @savedanswer = @test.savedanswers.build(savedanswers_params)
        @savedanswer.question_id = submit.question_id
        @savedanswer.entered_answer = submit.entered_answer 
        @savedanswer.user_id = submit.user_id
        @savedanswer.test_id = submit.test_id
        @savedanswer.option_id = submit.option_id
        @savedanswer.blank_id = submit.blank_id
        @savedanswer.entered_blank = submit.entered_blank
        @savedanswer.truefalse_id = submit.truefalse_id
        @savedanswer.entered_state = submit.entered_state

        if @savedanswer.save
          submit.destroy
        end
      end

      @retake.destroy
      redirect_to test_path(@test), notice: "Request Approved"
    else
      redirect_to test_path(@test), alert: "Retake or associated user not found." # Adjust the path and message accordingly
    end
  end

  private

  def savedanswers_params 
    params.require(:savedanswer).permit(:question_id, :entered_answer, :user_id, :test_id, :option_id, :blank_id, :entered_blank, :truefalse_id, :entered_state)
  end  
end
  