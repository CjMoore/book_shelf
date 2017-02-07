require_relative '../rails_helper.rb'

describe "When user visits show page for book" do
  scenario "they see details for that book" do
    book = Book.create(title: "IT", price: 10.99, quantity: 9)

    visit(book_path(book))

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
