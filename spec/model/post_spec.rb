require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = User.create(name: 'Tom', photo: 'photo', bio: 'Teacher from Mexico', postsCounter: 0)
    @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post', commentsCounter: 0,
                        likesCounter: 0)
    @comments = []
  end

  it 'title should be present and no longer than 250 characters' do
    @post.title = 'Hello'
    expect(@post).to be_valid
  end

  it 'commentsCounter should be an integer and greater or equal to zero' do
    @post.commentsCounter = 0
    expect(@post).to be_valid
  end

  it 'likesCounter should be an integer and greater or equal to zero' do
    @post.likesCounter = 0
    expect(@post).to be_valid
  end

  it 'should returns the five most recent comments' do
    result = @post.five_most_recent_comments
    expect(result).to eq(@comments)
  end

  it 'method should updates the postsCounter' do
    @post.send(:update_posts_counter)
    expect(@user.reload.postsCounter).to eq(1)
  end
end
