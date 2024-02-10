class SubmitsController < ApplicationController
  before_action :set_test
  before_action :set_submit, only: [:show, :edit, :update, :destroy]

  def index
    @submits = @test.submits
    render json: @submits
  end

  def new
    @submit = @test.submits.new
    @questions = @test.questions.all
    @blanks = @test.blanks.all
    @truefalses = @test.truefalse.all
    @submits = current_user.submits.where(test_id: @test.id)
  end

  def create
    submitted_answers = submit_params[:answers] || {}
    submitted_blanks = submit_params[:blanks] || {}
    submitted_truefalses = submit_params[:truefalses] || {}

    if submitted_answers.present? || submitted_blanks.present? || submitted_truefalses.present?
      submitted_answers.each do |question_id, option_id|
        @test.submits.create!(
          user_id: current_user.id,
          question_id: question_id,
          option_id: option_id
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

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_submit
    @submit = @test.submits.find(params[:id])
  end

  def submit_params
    params.require(:submit).permit(
      :user_id,
      :entered_answer,
      :question_id,
      :option_id,
      { answers: {} },
      { blanks: {} },
      { truefalses: {} },
      :blank_id,
      :entered_blank,
      :truefalse_id,
      :entered_state
    )
  end
end
