require 'rails_helper'

RSpec.describe "user log in" do
  it "can log in with valid credentials" do
    user = User.create!(name: "Dr. Nick", password: "hidrnick", password_confirmation: "hidrnick", email: "halfoffdr@gmail.com" )

    visit root_path

    click_on "I already have an account"

    expect(current_path).to eq(login_path)

    fill_in :name, with: user.name
    fill_in :password, with: user.password
    
    click_on "Log In"

    expect(current_path).to eq(root_path)

    expect(page). to have_content("Hi, #{user.name}!")
  end  

  it "cannot log in with bad credentials" do
    user = User.create!(name: "Dr. Nick", password: "hidrnick", password_confirmation: "hidrnick", email: "halfoffdr@gmail.com" )
  
    visit login_path
    
    fill_in :name, with: user.name
    fill_in :password, with: "incorrect password"
  
    click_on "Log In"
  
    expect(current_path).to eq(login_path)
  
    expect(page).to have_content("Sorry, your credentials are bad, and you should feel bad.")
  end
end