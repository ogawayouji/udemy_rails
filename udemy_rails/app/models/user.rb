# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)      not null
#  password_digest :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_name  (name) UNIQUE
#
class User < ApplicationRecord
    # Userモデルに password,password_confirmation属性が追加
    has_secure_password
    # validationを追加, name は 入力必須である、既に存在していない、長さ制限、小文字制限（正規表現）
    validates :name,
        presence: true, #入力必須である
        uniqueness: true, #既に存在していない
        length: { maximum: 16 },
        format: {
            with: /\A[a-z0-9]+\z/, 
            messsage: 'は小文字英数字で入力してください'
        }# //の中が正規表現、行頭\A 行末\z

    validates :password,
        length: { minimum: 8 }
end
