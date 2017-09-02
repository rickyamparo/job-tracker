require 'rails_helper'

describe "User sees one category" do
  scenario "user sees a category" do
    job = create(:job)
    category = Category.find(job.category.id)

    visit category_path(category)

    expect(current_path).to eq("/categories/#{category.id}")
    expect(page).to have_content(category.title)
    expect(page).to have_content(category.jobs.first.title)
  end
end
