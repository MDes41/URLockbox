require "rails_helper"

RSpec.describe "Filter", :js => :true do
  scenario "searches for the urls marked read true" do

    user = create :user, email: 'md', password: '123', password_confirmation: '123'
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    create :link, url: 'http://turing.io', user: user, read: true
    create :link, url: 'http://cantfind.io', user: user, read: false

    visit "/"

    expect(page).to have_content('http://cantfind.io')
    expect(page).to have_content('http://turing.io')

    click_on 'only-read-links'
    sleep(1)

    expect(page).to_not have_content('http://cantfind.io')
    expect(page).to have_content('http://turing.io')
  end

  scenario "searches for the urls marked read false" do

    user = create :user, email: 'md', password: '123', password_confirmation: '123'
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    create :link, url: 'http://turing.io', user: user, read: false
    create :link, url: 'http://cantfind.io', user: user, read: true

    visit "/"

    expect(page).to have_content('http://cantfind.io')
    expect(page).to have_content('http://turing.io')

    click_on 'only-unread-links'
    sleep(1)

    expect(page).to_not have_content('http://cantfind.io')
    expect(page).to have_content('http://turing.io')
  end
end