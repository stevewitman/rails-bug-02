require 'rails_helper'
require 'capybara/rails'

feature 'Auth' do

  scenario 'Users can login and out' do
    create_user email: "user@example.com"

    visit root_path
    within(".signin-form") { click_on "Login" }
    expect(page).to have_content("Username / password is invalid")

    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    within(".signin-form") { click_on "Login" }
    expect(page).to have_content("user@example.com")
  end

  scenario "users can signup" do
    visit '/'
    expect(page).to have_content("Login")
    expect(page).to have_content("Register")
    click_on "Register"
    fill_in "Name", with: "testname"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Confirm", with: "password"
    within("form#new_user") do


      click_on("Register")
    end
    expect(page).to have_content("You are logged in successfully.")
  end

end
