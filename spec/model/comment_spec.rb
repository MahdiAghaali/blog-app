require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = User.create(name: 'Tom', photo: 'photo', bio: 'Teacher from Mexico', postsCounter: 0)
    @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post', commentsCounter: 0,
                        likesCounter: 0)
    @comment = Comment.create(post: @post, author: @user, text: 'Hi Myself!')
  end

  it 'method should updates the commentsCounter' do
    @comment.send(:update_comments_counter)
    expect(@post.reload.commentsCounter).to eq(1)
  end
end
