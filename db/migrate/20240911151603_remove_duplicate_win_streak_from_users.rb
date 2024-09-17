class RemoveDuplicateWinStreakFromUsers < ActiveRecord::Migration[7.2]
  def change
    remove_column :users, :win_streak, :integer
  end
end
