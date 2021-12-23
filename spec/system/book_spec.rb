require "rails_helper"

RSpec.describe "books", type: :system do
  it "GET /books" do
    visit "/books"
    expect(page).to have_text("Books")
  end

  it "POST /books" do
    visit "/books/new"
    fill_in "Title", with: "RubyBook"
    fill_in "Author", with: "its"
    click_button "Create Book"

    expect(page).to have_text("Book was successfully created.")
    expect(page).to have_text("Title: RubyBook")
    expect(page).to have_text("Author: its")
  end

  it "enables me to create widgets" do
    book = FactoryBot.create(:book)
    visit "/books"
    expect(page).to have_text(book.title)
  end
end
