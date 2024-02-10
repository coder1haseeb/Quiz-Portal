class StudentsController < ApplicationController

  before_action :set_student , only: [:destroy , :edit , :show]
  before_action :validate_admin , only: [:edit, :update, :show, :destory ,:new]
  before_action :authenticate_user!
  def index
    @users = User.all.order("created_at")
  end
  
  def create
    @user = User.create(student_params)
    if @user.save
      redirect_to new_student_path , notice: "User created Successfully"
    else
      render "new"
    end
  end

  def new
    @user = User.new
  end

  def show
    @assignments = Assignment.all
  end

  def edit
    
  end

  def update
    if @user.update(student_update_params)
      redirect_to root_path
    else
      render "edit"
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

  def student_params
    params.require(:user).permit(:name , :username , :email , :password , :password_confirmation , :role , :image)
  end
  def student_update_params
    params.require(:user).permit(:name , :username , :email , :password , :password_confirmation , :current_password , :image)
  end

  def set_student
    @user = User.find(params[:id])
  end

  def validate_admin
    unless current_user.role == "super admin" || current_user.role == "admin"
      flash[:notice] = "You are not allowed to perform this action."
      redirect_to root_path
    end
  end
end
