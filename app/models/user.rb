class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 50 },
                                    format: { with: EMAIL_REGEX },
                                    uniqueness: { case_sensetive: false }
  has_secure_password
  has_many :posts, dependent: :destroy

  def self.all_except(user)
    where.not(id: user)
  end

  def feed
    other_users = User.all_except(id)
    other_users_posts = Post.where(is_private: false)
    return Post.where("id IN (?) OR user_id = ?", other_users_posts.ids, id)
  end
end
