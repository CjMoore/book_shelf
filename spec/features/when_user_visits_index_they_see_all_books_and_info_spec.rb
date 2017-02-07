require_relative '../rails_helper.rb'

describe "When user visits books index" do
  scenario "they are able to view all books and details" do
    Book.create(title: "IT", price: 10.99, quantity: 6)
    visit(books_path)

    within('h1') do
      expect page.has_content?("Books")
    end

    within("a") do
      expect page.has_content?(Book.find(1).title)
    end
  end
end
