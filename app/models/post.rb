class Post < ApplicationRecord
  belongs_to :user
  validates :content, presence: true,  length: { maximum: 255 }
  # default_scope { where(is_private: false) }
end
