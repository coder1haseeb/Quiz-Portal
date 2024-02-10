class FinalsController < ApplicationController
    before_action :set_test

    def create
      @final = @test.finals.build(fianl_params)
      @user = User.find(params[:user_id])
      if @final.save
        redirect_to test_submits_path(@test , user_id: @user.id) , notice: "Success"
      end
    end

    private

    def fianl_params
      params.require(:final).permit(:test_id , :user_id)
    end

    def set_test
        @test = Test.find(params[:test_id])
    end

end