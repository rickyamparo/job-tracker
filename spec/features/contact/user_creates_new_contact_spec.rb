require 'rails_helper'

describe "User creates new comment for job" do
  scenario "a user uses the comment form to create a new comment" do
    contact = create(:contact)
    company = contact.company

    name = "Turtanator"
    email = "Schmeckles@gmail.com"
    position = "Exterminator"

    visit company_path(company)

    fill_in "contact[name]", with: name
    fill_in "contact[email]", with: email
    fill_in "contact[position]", with: position
    click_button "Create"

    expect(current_path).to eq "/companies/#{company.id}"
    expect(page).to have_content name
    expect(page).to have_content email
    expect(page).to have_content position
  end
end
