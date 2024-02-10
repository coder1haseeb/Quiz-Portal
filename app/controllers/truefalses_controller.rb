class TruefalsesController < ApplicationController
  before_action :set_test

  def index
    @truefalses = @test.truefalse.all
  end

  def create
    @truefalse = @test.truefalse.build(truefalse_params)
    if @truefalse.save
      redirect_to test_truefalses_path(@test)
    else
      render "new"
    end
  end

  def new
    @truefalse = TrueFalse.new
  end

  def edit
    @truefalse = @test.truefalse.find(params[:id])
  end

  def update
    @truefalse = @test.truefalse.find(params[:id])
    if @truefalse.update(truefalse_params)
      redirect_to test_truefalses_path(@test)
    else
      render "edit"
    end
  end

  def destroy
    @truefalse = @test.truefalse.find(params[:id])
    @truefalse.destroy
    redirect_to test_truefalses_path(@test)
  end

  private

  def truefalse_params
    params.require(:truefalse).permit(:statement, :state, :test_id, :marks)
  end

  def set_test
    @test = Test.find(params[:test_id])
  end
end
