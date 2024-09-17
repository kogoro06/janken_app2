class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :username, presence: true, uniqueness: true, allow_blank: true
  validate :profile_image_format

  has_one_attached :profile_image

  # 現在の連勝数を返すロジック
  def win_streak
    # ここでは `win_streak` 属性を返すだけですが、実際には
    # ゲームの履歴などに基づくロジックが必要になるかもしれません
    self[:win_streak] || 0
  end

  # 最大連勝数を返すロジック
  def max_streak
    # ここでは `max_streak` 属性を返すだけですが、実際には
    # ゲームの履歴などに基づくロジックが必要になるかもしれません
    self[:max_streak] || 0
  end

  # プロフィール画像のフォーマットを検証する
  def profile_image_format
    if profile_image.attached?
      unless profile_image.content_type.in?(%('image/png image/jpeg'))
        errors.add(:profile_image, 'はPNGまたはJPEG形式である必要があります')
      end
    end
  end
end
