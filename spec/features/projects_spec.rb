require 'rails_helper'

RSpec.feature "Projects", type: :feature do
  before do
    @user = FactoryGirl.create(:user)
  end

  scenario "user creates a new project" do
    visit root_path
    click_link "Log in"
    fill_in "user[email]", with: @user.email
    fill_in "user[password]", with: @user.password
    click_button "Log in"

    expect(page).to have_content "Your Projects"

    click_link "Projects"
    click_link "New Project"
    fill_in "project[title]", with: "Test Project 1"
    fill_in "project[auditee]", with: "Test Co."
    click_button "Create Project"

    expect(page).to have_content "Audit Requests"
    expect(page).to have_content "Contributors: Abe"
  end

  scenario "user edits a project" do
    visit root_path
    click_link "Log in"
    fill_in "user[email]", with: @user.email
    fill_in "user[password]", with: @user.password
    click_button "Log in"

    visit projects_path
    click_link "Edit"
    fill_in "project[title]", with: "Test Project Edited!"
    fill_in "project[auditee]", with: "Edited Co."
    click_button "Update Project"

    expect(page).to have_content "Project was successfully updated"
    expect(page).to have_content "Test Project Edited!"
    expect(page).to have_content "Client: Edited Co."
  end
end
