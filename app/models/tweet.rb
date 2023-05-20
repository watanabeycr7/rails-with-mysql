class Tweet < ApplicationRecord
    # 中身が空のツイートは保存できないようにする。
    validates :text, presence: true
    validates :text, length: { maximum: 10 }
end
