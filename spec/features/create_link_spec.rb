require "rails_helper"

RSpec.describe "can create links", :js => :true do
  scenario "Create a new link" do
    user = create :user, email: 'md', password: '123', password_confirmation: '123'
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit "/"
    fill_in 'link-title', :with => "Turing"
    fill_in "link-url", :with => "http://turing.io"
    click_on "Add Link"

    within('#links-list') do
      expect(page).to have_text("Turing")
      expect(page).to have_text("http://turing.io")
    end

  end

  scenario 'gets an error when submits an incorrect link' do
    user = create :user, email: 'md', password: '123', password_confirmation: '123'
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path
    fill_in "link-title", :with => "Turing"
    fill_in "link-url", :with => "//turing.io"
    click_on "Add Link"


    within('#links-list') do
      expect(page).to_not have_text("Turing")
      expect(page).to_not have_text("http://turing.io")
    end
    sleep(2)
    expect(page).to have_content('Url is not a valid url')
  end

end
