class ResultsController < ApplicationController
    before_action :set_test

    def create
        @result = @test.results.build(result_params)
        @user = User.find(params[:user_id])
        if @result.save
        redirect_to test_submits_path(@test , user_id: @user.id) , notice: "Success"
        end
    end

    private

    def result_params
        params.require(:result).permit(:status, :test_id , :user_id)
    end

    def set_test
        @test = Test.find(params[:test_id])
    end
end
