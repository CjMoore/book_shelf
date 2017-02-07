require_relative '../rails_helper.rb'

describe "When user fills out the new form" do
  scenario "they are able to create a new book and display details on show" do
    visit(new_book_path)

    save_and_open_page

    fill_in('title', :with => "IT")
    fill_in('quantity', :with => 9)
    fill_in('price', :with => 10.99)

    click_on("Create Book")

    expect page.has_current_path?(book_path(Book.find(1)))

    within("h4") do
      expect page.has_content?("IT")
    end

    within(".price") do
      expect page.has_content?(10.99)
    end

    within(".quantity") do
      expect page.has_content?(9)
    end
  end
end
