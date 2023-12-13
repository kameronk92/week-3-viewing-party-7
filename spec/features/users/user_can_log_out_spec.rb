require 'rails_helper'
RSpec.describe "User Log Out" do
  it "allows a user to log out" do
    user = User.create(name: "Bob", email: "bob@johnsons.com", password: "password", password_confirmation: "password")

    visit login_path

    fill_in :name, with: user.name 
    fill_in :password, with: user.password
    click_button "Log In"

    expect(current_path).to eq(root_path)

    expect(page).to_not have_content("I already have an account")
    expect(page).to have_button("Log Out")
    click_button "Log Out"

    expect(current_path).to eq(root_path)
    visit root_path
    
    expect(page).to_not have_button("Log Out")
    expect(page).to have_content("I already have an account")
  end
end