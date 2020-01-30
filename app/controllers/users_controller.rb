class UsersController < ApplicationController

  before_action :authenticate_user, {except: [:login, :login_post, :signup, :signup_post]}
  before_action :forbid_login_user, {only: [:login, :login_post, :signup, :signup_post]}

  def index
    @users = User.all
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
      @user = User.new( name: params[:name],password: params[:password], admin: false )
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
