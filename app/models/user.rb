class User < ApplicationRecord
  has_many :likes, class_name: 'Like'
  has_many :comments, class_name: 'Comment'
  has_many :posts, class_name: 'Posts'
  validates :name, presence: true
  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recents_post
    Post.limit(3).order(created_at: :desc)
  end
end
