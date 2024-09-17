class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to play_janken_path, notice: "ユーザ登録完了"
    else
      render :new
    end
  end

  def show
    # @userはset_userメソッドで設定されています
  end

  def edit
    # @userはset_userメソッドで設定されています
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'プロフィールが更新されました。'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:username, :profile_image)
  end

  def ranking
    @top_players = Player.order(win_streak: :desc).limit(10) # 例: 連勝数でソートして上位10名を取得
  end
end
