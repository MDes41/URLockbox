require "rails_helper"

RSpec.describe "can mark links as read", :js => :true do
  scenario "Mark a link as read" do
    user = create :user, email: 'md', password: '123'
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    user.links.create(url:"https://turing.io", title:"Turing")
    visit "/"
    within('.link .link_read') do
      expect(page).to have_text("false")
    end

    click_on "Mark as Read"
    within('.link .link_read') do
      expect(page).to have_text("true")
    end

  end
end
