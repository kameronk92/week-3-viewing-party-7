require 'rails_helper'

RSpec.describe 'Existing Users Hidden' do
  it "does not show existing users if user is not logged in" do
    user = User.create(name: "Bob", email: "bob@gmail.com", password: "password", password_confirmation: "password")

    visit root_path

    expect(page).to_not have_content("bob@gmail.com")

    click_on "I already have an account"

    expect(current_path).to eq(login_path)

    fill_in :name, with: user.name
    fill_in :password, with: user.password
    
    click_on "Log In"

    expect(current_path).to eq(root_path)

    expect(page).to have_content("bob@gmail.com")
  end
end