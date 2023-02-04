require 'rails_helper'

RSpec.describe 'User', type: :system do
  describe 'show page' do
    before :each do
      @user = User.create(name: 'Tom',
                          bio: 'Teacher from Mexico.',
                          photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          postsCounter: 0)
      visit user_path(@user.id)
    end

    it 'shows profile picture of the user' do
      expect(page).to have_content(@user.photo)
    end

    it 'shows name of the user' do
      expect(page).to have_content(@user.name)
    end

    it 'shows the number of posts the user has written' do
      expect(page).to have_content("Number of posts: #{@user.postsCounter}")
    end

    it 'shows the bio of the user' do
      expect(page).to have_content(@user.bio)
    end

    it 'shows users first 3 posts' do
      @posts = @user.three_most_recent_posts
      @posts.each do |post|
        expect(page).to have_content(post.text)
      end
    end

    it 'shows the see all post button' do
      expect(page).to have_content('See all posts')
    end

    it 'redirects to the me to that posts show page when clicked' do
      @posts = @user.three_most_recent_posts
      @posts.each do |post|
        click_on(post.text)
        expect(page).to have_current_path("/users/#{@user.id}/posts/#{post.id}")
      end
    end

    it 'redirects to user posts index when cliked' do
      click_link('See all posts')
      expect(page).to have_current_path("/users/#{@user.id}/posts")
    end
  end
end
