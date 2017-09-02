require 'rails_helper'

describe "User edits an existing category" do
  scenario "a user can edit a category" do
    title = "Turtle Whisperer"
    category = create(:category)

    visit edit_category_path(category)

    fill_in "category[title]", with: title
    click_button "Update"

    expect(current_path).to eq("/categories/#{category.id}")
    expect(page).to have_content(title)
  end
end
