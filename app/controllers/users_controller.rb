class UsersController < ApplicationController

  before_action :authenticate_user, {except: [:login, :login_post, :signup, :signup_post]}
  before_action :forbid_login_user, {only: [:login, :login_post, :signup, :signup_post]}

  def index
    @users = User.all
  end

  def edit
  end

  def edit_post
    if @current_user.authenticate(params[:old_password])
      auth_flag = true
    else
      auth_flag = false
      @error_message = "現在のパスワードが間違っています。"
    end
    @current_user.password = params[:new_password]
    if @current_user.valid? && auth_flag
      @current_user.save
      redirect_to "/settings", success: "パスワードを変更しました。"
    else
      @new_password = params[:new_password]
      @old_password = params[:old_password]
      render "users/edit"
    end
  end

  def destroy
    if @current_user.admin
      redirect_to "/settings", success: "管理者アカウントは削除できません。"
    else
      @current_user.destroy
      redirect_to "/", success: "アカウントは正常に削除されました。"
    end
  end

  def signup
    @user = User.new
  end

  def signup_post
    # 暫定的に追加。ユーザー数制限
    if User.all.length >=30
      @user = User.new
      flash.now[:warning] = 'ユーザー数の上限を超えたためサインアップできません。'
      render "users/signup"
      # 暫定追加ここまで
    else
      @user = User.new( name: params[:name], password: params[:password], admin: false )
      if @user.save
        session[:user_id] = @user.id
        redirect_to "/mypage", success: "Secure-Typingにようこそ！ アカウントは正常に作成されました。"
      else
        render "users/signup"
      end
    end
  end

  def login
  end

  def login_post
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/mypage", success: "ようこそ、#{@user.name}さん。"
    else
      @error_message = "ユーザー名かパスワードが間違っています。"
      @name = params[:name]
      @password = params[:password]
      render "users/login"
    end
  end

  def logout_post
    session[:user_id] = nil
    redirect_to "/login", success: "ログアウトしました。"
  end

end
