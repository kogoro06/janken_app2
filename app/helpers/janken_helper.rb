# app/helpers/janken_helper.rb
module JankenHelper
    def direction_image(direction)
      case direction
      when '上'
        'up.png'
      when '下'
        'down.png'
      when '左'
        'left.png'
      when '右'
        'right.png'
      else
        'default.png' # デフォルト画像
      end
    end
  end
  