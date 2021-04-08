class Follow < ApplicationRecord

  # 1.	belongs_to :following 即便沒有following這個表格，仍可以設定.following方法。
  # 2.	foreign_key: 'following_id' 雖然可以設定，但是要告知是根據什麼key。
  # 3.	class_name: 'User'本質參考user這個model
  # 4.	rails 的慣例：belongs_to: user等於 belongs_to: user, foreign_key: 'user_id' class_name: 'User'
  
  belongs_to :user
  belongs_to :following, foreign_key: 'following_id', class_name: 'User'

end