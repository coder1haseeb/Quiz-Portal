class BlanksController < ApplicationController

  before_action :set_test, :validate_admin

  def index
    @blanks = @test.blanks.all
    @blank = @test.blanks.build
  end

  def create
    @blank = @test.blanks.build(blank_params)
    @blank.test_id = @test.id
  
    if @blank.save
      redirect_to test_blanks_path(@test)
    elsif !@blank.save
      redirect_to test_blanks_path(@test) , alert: "Error: The 'blank' field must contain the pattern '__blank__'."
    else
      render "new"
    end
  end
  
  def edit
    @blank = @test.blanks.find(params[:id])
  end
  
  def update
    @blank = @test.blanks.find(params[:id])
    if @blank.update(blank_params)
      redirect_to test_blanks_path(@test)
    elsif !@blank.update(blank_params)
      redirect_to edit_test_blank_path(@test) , alert: "Error: The 'blank' field must contain the pattern '__blank__'."
    else
      render "edit"
    end
  end  

  def destroy
    @blank = @test.blanks.find_by(params[:id])
    @blank.destroy
    redirect_to test_blanks_path(@test)
  end

  private

  def blank_params
    params.require(:blank).permit(:blank, :correct_blank ,:test_id, :marks)
  end

  def set_test      
    @test = Test.find(params[:test_id])
  end

  def validate_admin
    unless @test.user_id == current_user.id
      redirect_to root_path, alert: "You are not a valid admin to edit this."
    end
  end

end