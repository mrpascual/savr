class User < ActiveRecord::Base
  has_secure_password

  has_many :posts
  has_many :comments
  has_many :playlists

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
end
