require 'rails_helper'

RSpec.feature 'User can login' do
  context 'with proper params' do
    scenario 'an existing user can login to account and see different navbar' do
      user = create :user, email: 'md', password: '123'
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path
      click_on 'Signout'

      expect(current_path).to eq(login_path)
      expect(page).to have_content('Login')
      expect(page).to have_content('Create Account')
      expect(page).to_not have_content('Signout')
    end
  end
end