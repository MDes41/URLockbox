require "rails_helper"

RSpec.describe "can mark links as read", :js => :true do
  scenario "Mark a link as read" do
    user = create :user, email: 'md', password: '123', password_confirmation: '123'
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

  scenario "Button shows up to mark as unread" do
    user = create :user, email: 'md', password: '123', password_confirmation: '123'
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    user.links.create(url:"https://turing.io", title:"Turing")
    visit "/"
    within('.link') do
      expect(page).to have_button("Mark as Read")
      expect(page).to_not have_button("Mark as Unread")
    end

    click_on "Mark as Read"
    
    within('.link') do
      expect(page).to have_button("Mark as Unread")
      expect(page).to_not have_button("Mark as Read")
    end

  end
end
