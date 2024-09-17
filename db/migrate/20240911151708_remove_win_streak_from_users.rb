class RemoveWinStreakFromUsers < ActiveRecord::Migration[7.2]
  def change
    remove_column :users, :win_streak, :integer
    remove_column :users, :max_streak, :integer if column_exists?(:users, :max_streak)
  end
end
