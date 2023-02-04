require 'rails_helper'

RSpec.describe 'User', type: :system do
  describe 'index page' do
    before :each do
      @user = User.create(name: 'Tom',
                          bio: 'Teacher from Mexico.',
                          photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          postsCounter: 0)
      visit '/users'
    end
    it 'shows the username of all users' do
      expect(page).to have_content(@user.name)
    end

    it 'shows profile picture of each user' do
      expect(page).to have_content(@user.photo)
    end

    it 'shows the number of posts each user has written' do
      expect(page).to have_content("Number of posts: #{@user.postsCounter}")
    end

    it 'click on a user and I am redirected to that users show page' do
      click_on(@user.name, match: :first)
      expect(page).to have_current_path("/users/#{@user.id}")
    end
  end
end
