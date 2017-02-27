
require 'rails_helper'

RSpec.feature 'User' do
  context 'can create an account' do
    scenario 'creates an account with correct password confirmation' do
      visit root_path
      click_on 'Create Account'
      fill_in 'user[email]', with: 'md'
      fill_in 'user[password]', with: '123'
      fill_in 'user[password_confirmation]', with: '123'
      click_on 'Create Account'

      expect(current_path).to eq(root_path)
      expect(page).to_not have_content('Login')
      expect(page).to have_content('Signout')
    end
  end

  context 'cannot create an account' do
    scenario 'without proper password confirmation, and it show error message' do
      visit root_path
      click_on 'Create Account'
      fill_in 'user[email]', with: 'md'
      fill_in 'user[password]', with: '123'
      fill_in 'user[password_confirmation]', with: ''
      click_on 'Create Account'

      expect(current_path).to eq(signup_path)
      expect(page).to have_button('Create Account')
      expect(page).to_not have_content('Logout')
    end
  end
end