class Comment < ApplicationRecord
  belongs_to :post, class_name: 'Post', foreign_key: 'postid'
  belongs_to :author, class_name: 'User', foreign_key: 'authorid'
  validates :postid, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  after_save :upadate_comments

  def upadate_comments
    counter = Comment.count('postid')
<<<<<<< HEAD
<<<<<<< HEAD
    Post.update(comments_counter: counter)
=======
    Post.update(commentscounter: counter)
>>>>>>> parent of a6bb258 (Merge pull request #5 from MahdiAghaali/feature/routes)
=======
    Post.update(commentscounter: counter)
>>>>>>> parent of a6bb258 (Merge pull request #5 from MahdiAghaali/feature/routes)
  end
end
