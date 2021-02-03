class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  # GET /users
  # GET /users.json
  def index
    #@users = User.all
    @users = User.paginate :page => params[:page], :per_page => 3

  end

  # GET /users/1
  # GET /users/1.json
  def show
    #@articles = @user.articles
    @articles = @user.articles.paginate :page => params[:page], :per_page => 3
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    #respond_to do |format|
      if @user.save
          flash[:notice] = "User was successfully created. Welcome #{@user.username}"
        # format.html 
         session[:user_id] = @user.id
         redirect_to @user
        # end
        # format.html { redirect_to @user, notice: "User was successfully created. Welcome #{@user.username}" }
        # format.json { render :show, status: :created, location: @user }
      else
        render 'new'
        # format.html { render :new }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    # end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    session[:user_id] = nil
    flash[:notice] = "User and associated articles are deleted"
    redirect_to articles_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit!
    end

    def require_same_user
      if current_user != @user
        flash[:alert] = "You are only allow to edit your own profile"
        redirect_to @user
      end
    end
end
