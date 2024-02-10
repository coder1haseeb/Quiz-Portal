class AssignmentsController < ApplicationController
    before_action :set_assignment, only: [:edit, :update, :show, :destroy]
    before_action :validate_creator , only: [:create, :edit, :update, :show, :destory]
    # before_action :set_test, only: [:new, :create, :edit, :update, :show, :destroy]
  
    def index
      @tests = current_user.tests.all.order("created_at")
    end
  
    def create
        @assignment = Assignment.new(assignment_params)
        @test = Test.find(params[:assignment][:test_id])
        if @assignment.save
            redirect_to new_assignment_path, notice: "User added Successfully."
        else
            render "new"
        end
    end
    
    def new
      @assignments = Assignment.all
      @test = Test.all
      @assignment = Assignment.new
      # Assuming test_id is passed correctly in params (e.g., params[:test_id])
      @test = Test.find(params[:test_id])
      @users = User.normalUsers
    end
  
    def show
      # Add code as needed for showing assignment details
    end
  
    def edit
      # Add code as needed for editing assignment
    end
  
    def update
      if @assignment.update(assignment_params)
        redirect_to assignments_path, notice: "Assignment Updated Successfully."
      else
        render "edit"
      end
    end
  
    def destroy
      @assignment.destroy
      redirect_to new_assignment_path, notice: "Assignment deleted Successfully."
    end
  
    private
  
    def assignment_params
      params.require(:assignment).permit(:test_id, :user_id)
    end
  
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end
  
    def validate_creator
      @test = Test.find(params[:test_id] || params[:assignment][:test_id])
      if @test.user_id != current_user.id
        redirect_to root_path, alert: "You are not the valid author!"
      end
    end
    # def set_test
    #   # Assuming test_id is passed correctly in params (e.g., params[:test_id])
    #   @test = Test.find(params[:test_id])
    # end
  end
  