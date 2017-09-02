require 'rails_helper'

describe "User creates a new category" do
  scenario "a user can create a new category" do
    title = "Turtle Master"

    visit new_category_path

    fill_in "category[title]", with: title
    click_button "Create"

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content(title)
    expect(Category.count).to eq(1)
  end

  scenario "a user cannot create categories with the same name" do
    title = "Turtle Enthusiast"

    visit new_category_path

    fill_in "category[title]", with: title
    click_button "Create"

    expect(current_path).to eq("/categories/#{Category.last.id}")

    visit new_category_path

    fill_in "category[title]", with: title
    click_button "Create"

    expect(current_path).to eq("/categories/new")
    expect(Category.count).to eq(1)
  end
end
