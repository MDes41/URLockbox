
require 'rails_helper'

RSpec.feature 'User can login' do
  context 'with proper params' do
    scenario 'an existing user can login to account and see different navbar' do
      user = create :user, email: 'md', password: '123', password_confirmation: '123'
      visit root_path
      click_on 'Login'
      fill_in 'email', with: 'md'
      fill_in 'password', with: '123'
      click_on 'Login'


      expect(current_path).to eq(root_path)
      expect(page).to_not have_content('Login')
      expect(page).to have_content('Signout')
    end
  end

  context 'without proper params' do
    scenario 'an existing user cannot login to account and see different navbar' do
      user = create :user, email: 'md', password: '123', password_confirmation: '123'
      visit root_path
      click_on 'Login'
      fill_in 'email', with: 'md'
      fill_in 'password', with: ''
      click_on 'Login'

      expect(current_path).to eq(login_path)
      expect(page).to_not have_content('Welcome, user md')
      expect(page).to_not have_content('Signout')
      expect(page).to have_button('Login')
    end
  end
end