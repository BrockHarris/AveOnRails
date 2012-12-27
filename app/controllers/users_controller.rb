class UsersController < ApplicationController    
before_filter :require_no_user, :only => [:new, :create]
before_filter :require_user, :only => [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Your account has been created."
      redirect_to signup_url
    else
      flash[:notice] = "There was a problem creating you."
      render :action => :new
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to current_user
    else
      render :action => :edit
    end
  end

  def following
    @title = " is following"
    @users = @user.following.paginate(:page => params[:page])
    render 'show_follow'
  end

  def followers
    @title = "'s followers"
    @users = @user.followers.paginate(:page => params[:page])
    render 'show_follow'
  end

  def follow
    @user =  User.find(params[:id])
    current_user.follow!(@user)
    redirect_to :back, :notice=>"You're now following #{@user.username}!"
  end

  def unfollow
    @user =  User.find(params[:id])
    current_user.unfollow!(@user)
    redirect_to :back, :notice=>"You stopped following #{@user.username}."
  end

end