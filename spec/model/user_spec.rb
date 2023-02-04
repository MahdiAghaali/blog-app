require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create(name: 'Tom', photo: 'photo', bio: 'Teacher from Mexico', postsCounter: 0)
    @posts = []
  end

  it 'name should be present' do
    @user.name = 'Tom'
    expect(@user).to be_valid
  end

  it 'postsCounter should be an integer and greater or equal to zero' do
    @user.postsCounter = 0
    expect(@user).to be_valid
  end

  it 'should returns the last 3 posts of a user' do
    result = @user.three_most_recent_posts
    expect(result).to eq(@posts)
  end
end
