class Tweet < ApplicationRecord
    # 中身が空のツイートは保存できないようにする。
    validates :text, presence: true
end
