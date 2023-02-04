require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @user = User.create(name: 'Tom', photo: 'photo', bio: 'Teacher from Mexico', postsCounter: 0)
    @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post', commentsCounter: 0,
                        likesCounter: 0)
    @like = Like.create(post: @post, author: @user)
  end

  it 'method should updates the likesCounter' do
    @like.send(:update_likes_counter)
    expect(@post.reload.likesCounter).to eq(1)
  end
end
