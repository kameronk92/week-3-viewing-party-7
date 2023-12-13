require 'rails_helper'

RSpec.describe "user must be logged in to access dashboard" do
  it "cannot access dashboard if not logged in" do
    user = User.create!(name: "Dr. Nick", password: "hidrnick", password_confirmation: "hidrnick", email: "drnick@gmail.com")

    visit dashboard_path

    expect(page).to have_content("You must be logged in to access this page.")
  end

  it "can access dashboard if logged in" do
    user = User.create!(name: "Dr. Nick", password: "hidrnick", password_confirmation: "hidrnick", email: "drnick@gmail.com")
    visit login_path

    fill_in :name, with: user.name 
    fill_in :password, with: user.password
    click_button "Log In"

    visit dashboard_path

    expect(page).to have_content("Dashboard Page")
  end
end