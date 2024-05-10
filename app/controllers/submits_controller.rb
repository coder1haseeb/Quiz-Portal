class SubmitsController < ApplicationController
  before_action :set_test
  before_action :set_submit, only: [:show, :edit, :update, :destroy]

  def index
    user_id = params[:user_id]
    @user = User.find_by(id: user_id)
    @submits = @test.submits.where(test_id: @test.id, user_id: user_id)
    @result = @test.results.find_by(user_id: @user.id)
  end
  
  def new
    @submit = @test.submits.new
    @questions = @test.questions.all
    @blanks = @test.blanks.all
    @truefalses = @test.truefalse.all
    @result = @test.results.find_by(user_id: current_user.id)
    @submits = current_user.submits.where(test_id: @test.id)
    test_questions_count = @test.questions.count
    test_blanks_count = @test.blanks.count
    test_truefalse_count = @test.truefalse.count
    @test_all_enteries = test_questions_count + test_blanks_count + test_truefalse_count
  end

  def create
    submitted_answers = submit_question_params[:answers] || {}
    submitted_blanks = submit_blank_params[:blanks] || {}
    submitted_truefalses = submit_truefalse_params[:truefalses] || {}

    if submitted_answers.present? || submitted_blanks.present? || submitted_truefalses.present?
      submitted_answers.each do |question_id, option_id, trail|
        @test.submits.create!(
          user_id: current_user.id,
          question_id: question_id,
          option_id: option_id,
          trail: trail
        )
      end

      submitted_blanks.each do |blank_id, entered_blank|
        @test.submits.create!(
          user_id: current_user.id,
          blank_id: blank_id,
          entered_blank: entered_blank
        )
      end

      submitted_truefalses.each do |truefalse_id, entered_state|
        @test.submits.create!(
          user_id: current_user.id,
          truefalse_id: truefalse_id,
          entered_state: entered_state
        )
      end

      redirect_to new_test_submit_path(@test), notice: 'Answers submitted successfully.'
    else
      redirect_to new_test_submit_path(@test), alert: 'No answers submitted.'
    end
  end

  def show
  end

  def edit
    
  end

  def update

  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_submit
    @submit = @test.submits.find(params[:id])
  end

  def submit_question_params
    params.require(:submit).permit(
      :user_id,
      :question_id,
      :option_id,
      { answers: {} },
      :trail
    )
  end
  def submit_blank_params
    params.require(:submit).permit(
      :user_id,
      { blanks: {} },
      :blank_id,
      :entered_blank,
      :trail
    )
  end
  def submit_truefalse_params
    params.require(:submit).permit(
      :user_id,
      { truefalses: {} },
      :truefalse_id,
      :entered_state, 
      :trail
    )
  end
end
