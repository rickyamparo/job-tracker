require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    category = create(:category)
    category_two = create(:category)

    visit categories_path

    expect(page).to have_content(category.title)
    expect(page).to have_content(category_two.title)
  end
end
