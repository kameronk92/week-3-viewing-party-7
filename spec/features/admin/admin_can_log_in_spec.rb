require 'rails_helper'

RSpec.describe "Admin log in" do
  it "can log in with valid credentials" do
    admin = User.create!(name: "Dr. Nick", password: "hidrnick", password_confirmation: "hidrnick", email: "halfoffdr@gmail.com", role: 2 )

    visit root_path

    click_on "I already have an account"

    expect(current_path).to eq(login_path)

    fill_in :name, with: admin.name
    fill_in :password, with: admin.password
    
    click_on "Log In"

    expect(current_path).to eq(admin_dashboard_path)
  end  

  it "cannot log in with bad credentials" do
    user = User.create!(name: "Mr. Plow", password: "that'smyname", password_confirmation: "that'smyname", email: "mrplow@gmail.com", role: 0 )
  
    visit login_path
    
    fill_in :name, with: user.name
    fill_in :password, with: user.password
  
    click_on "Log In"
  
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_dashboard_path

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end