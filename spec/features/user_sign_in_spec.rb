require 'spec_helper'

feature "Sign in user function" do
  before :each do
    User.create(:username => 'kimi', :password => 'password')
  end

  scenario "Signing in with corrent user" do
    visit '/login'
    fill_in 'Username', :with  => 'kimi'
    fill_in 'Password', :with  => 'password' 
    click_button 'Login'
    expect(page).to have_content 'kimi'
  end

  given(:other_user) { User.create(:username => 'other', :password => 'password') }

  scenario "Signing in as another user" do
    visit '/login'
    fill_in 'Username', :with  => other_user.username 
    fill_in 'Password', :with  => 'wrong_password' 
    click_button 'Login'
    expect(page).to have_content 'something wrong with your username or password.'
  end
    
  given(:post) { Post.create(:title => 'Google', :url => 'http://google.com', :description => 'Google is a good company') }

  scenario "create a post with authenticate user" do
    visit '/login'
    fill_in 'Username', :with  => 'kimi'
    fill_in 'Password', :with  => 'password' 
    click_button 'Login'
    click_link 'New Post'
    fill_in 'Title', :with  => post.title
    fill_in 'Url', :with => post.url
    fill_in 'Description', :with => post.description
    click_button 'Create Post'
    expect(page).to have_content 'Google'
  end
end
