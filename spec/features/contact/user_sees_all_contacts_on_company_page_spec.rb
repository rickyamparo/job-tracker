require 'rails_helper'

describe "User sees all contacts on company page" do
  scenario "a user sees all the contacts for a company" do
    contact = create(:contact)
    company = contact.company

    visit company_path(company)

    expect(page).to have_content(contact.name)
  end
end
