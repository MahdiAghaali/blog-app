class Post < ApplicationRecord
  has_many :likes, class_name: 'Like', foreign_key: 'post_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'post_id'
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likescounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  after_save :update_post

  def update_post
    counter = Post.count('authorid')
    User.update(post_counter: counter)
  end

  def recents_comments
    Comment.order('created_at Desc').limit(5)
  end
end
