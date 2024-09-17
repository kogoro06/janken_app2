class JankenController < ApplicationController
  before_action :set_player_and_computer_choices, only: [:play, :hoi]

  def start
    # ゲームの開始
    # セッションやクッキーの初期化処理をここに追加することも可能
  end

  def play
    if params[:choice]
      session[:player_choice] = params[:choice]
  
      # あいこの場合にのみ、コンピュータの手を再度ランダムに決定する
      if session[:result] == "あいこ"
        session[:computer_choice] = ['グー', 'チョキ', 'パー'].sample
      else
        # 初回、またはあいこでない限り、セッションに保存されたコンピュータの選択を使用
        session[:computer_choice] ||= ['グー', 'チョキ', 'パー'].sample
      end
  
      @player_choice = session[:player_choice]
      @computer_choice = session[:computer_choice]
  
      @result = determine_result(@player_choice, @computer_choice)
      session[:result] = @result
  
      if @result == "負け"
        flash.now[:alert] = "残念、もう１回遊んでね"
        if current_user
          # 連勝数のリセット
          current_user.update(win_streak: 0)
        end
        # プレイヤーとコンピュータの手をリセット（次回新しい手でスタート）
        session[:player_choice] = nil
        session[:computer_choice] = nil
      elsif @result == "勝ち"
        flash.now[:notice] = "やったね！おめでとう"
        # 勝利しても連勝数は更新しない（あっち向いてホイの結果によってのみカウントされる）
      end
    else
      @player_choice = session[:player_choice]
      @computer_choice = session[:computer_choice]
      @result = nil
    end
  end  

  def hoi
    if params[:direction]
      session[:player_direction] = params[:direction]
      directions = ['上', '下', '左', '右']
      session[:computer_direction] = directions.sample
      @player_direction = session[:player_direction]
      @computer_direction = session[:computer_direction]

      @hoi_result = determine_hoi_result(@player_direction, @computer_direction)

      if @hoi_result == "勝ち"
        flash.now[:notice] = "あっち向いてホイでも勝利！"
        if current_user
          # 連勝数の更新
          new_streak = (current_user.win_streak || 0) + 1
          current_user.update(win_streak: new_streak)

          # 最大連勝数の更新
          max_streak = [new_streak, current_user.max_streak || 0].max
          current_user.update(max_streak: max_streak)
        end
        session[:player_direction] = nil # リセット
      elsif @hoi_result == "負け"
        flash.now[:alert] = "残念、あっち向いてホイで負けました"
        if current_user
          # 連勝数のリセット
          current_user.update(win_streak: 0)
        end
        session[:player_direction] = nil # リセット
      end
    else
      @player_direction = session[:player_direction]
      @computer_direction = session[:computer_direction]
      @hoi_result = nil
      @directions = ['上', '下', '左', '右']
    end
  end

  def ranking
    # 現在のユーザーも含めて、連勝数でソートして上位3人を取得
    @top_players = User.order(win_streak: :desc).limit(3)
    
    # 現在のユーザーがランキングに含まれていない場合、0勝でも1位として表示する
    if current_user && !@top_players.include?(current_user)
      # 連勝数が0のユーザーも含めるように調整
      @top_players = (@top_players + [current_user]).uniq.sort_by(&:win_streak).reverse.first(3)
    end
  
    # ビューで使う変数名を変更
    @users = @top_players
  end

  def my_score
    if current_user
      @current_streak = current_user.win_streak   # 現在の連勝数
      @max_streak = current_user.max_streak       # 最大連勝数
    else
      redirect_to login_path, alert: "ログインしてください"
    end
  end

  def reset
    # ゲームのリセット
    reset_session
    redirect_to start_janken_path
  end

  private

  def determine_result(player_choice, computer_choice)
    if player_choice == computer_choice
      "あいこ"
    elsif (player_choice == 'グー' && computer_choice == 'チョキ') ||
          (player_choice == 'チョキ' && computer_choice == 'パー') ||
          (player_choice == 'パー' && computer_choice == 'グー')
      "勝ち"
    else
      "負け"
    end
  end

  def determine_hoi_result(player_direction, computer_direction)
    if player_direction == computer_direction
      "勝ち"
    else
      "負け"
    end
  end

  def set_player_and_computer_choices
    @player_choice = session[:player_choice]
    @computer_choice = session[:computer_choice]
    @player_direction = session[:player_direction]
    @computer_direction = session[:computer_direction]
  end
end
