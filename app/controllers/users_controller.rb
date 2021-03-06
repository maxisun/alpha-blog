class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show, :create, :new]
  before_action :require_same_user, only: [:edit, :update]
  before_action :require_admin, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user_id] = @user.id
      flash[:success] = "Welcome to the Alpha Blog #{ @user.username }"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def index
    @users = User.all
  end

  def destroy
    @user.destroy
    flash[:danger] = "The user and his articles were successfully deleted"
    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def require_same_user
      if current_user != @user and !current_user.admin?
        flash[:danger] = "You can only edit your own profile"
        redirect_to root_path
      end
    end

    def require_admin
      if logged_in? and !current_user.admin?
        flash[:danger] = "Only admin users can perform this action"
        redirect_to root_path
      end
    end

end