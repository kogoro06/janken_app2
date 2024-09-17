class CreateStreakHistories < ActiveRecord::Migration[7.2]
  def change
    create_table :streak_histories do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :streak
      t.datetime :recorded_at

      t.timestamps
    end
  end
end
