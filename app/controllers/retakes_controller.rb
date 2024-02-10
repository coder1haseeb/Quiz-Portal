class RetakesController < ApplicationController
    before_action :set_test, :authenticate_user!
  
    def create
        @retake = @test.retakes.build(retake_params)
        @retake.user_id = current_user.id
        
        if @retake.save
            redirect_to new_test_submit_path(@test)	, notice: "Retake request successful."
        else
            render "new"
        end
    end

    def show
      
    end

    def destroy
      @retake = @test.retakes.find_by(params[:id])
      if @retake.destroy
        redirect_to test_path(@test) , notice: "Request Deleted."
      else
        redirect_to root_path , notice: "Something went wrong."
      end
    end
    
    def approval

    end
    private
    
    def retake_params
        params.require(:retake).permit(:user_id, :test_id, :obtained_marks, :total_marks)
    end
    
    def set_test
      @test = Test.find(params[:test_id])
    end
end
  