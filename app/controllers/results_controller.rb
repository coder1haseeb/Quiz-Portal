class ResultsController < ApplicationController
    before_action :set_test

    def create
        @result = @test.results.build(result_params)
        @user = User.find(params[:user_id])
        if @result.save
        redirect_to test_submits_path(@test , user_id: @user.id) , notice: "Success"
    end
end

    def show
        @result = @test.results.find_by(id: params[:id])
    end
    
    def edit
        @result = @test.results.find_by(params[:id])
    end
    
    def update
        @result = @test.results.find(params[:id])
        if @result.update(result_params)
          redirect_to test_submits_path(@test, user_id: @result.user_id), notice: "Success"
        else
          # Handle the case where result updating fails
          render :edit
        end
    end

    private

    def result_params
        params.require(:result).permit(:status, :test_id , :user_id, :retake)
    end

    def set_test
        @test = Test.find(params[:test_id])
    end
end
