class AddWinStreakAndMaxStreakToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :win_streak, :integer, default: 0
    add_column :users, :max_streak, :integer, default: 0
  end
end
