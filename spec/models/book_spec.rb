require 'rails_helper'

RSpec.describe Book, type: :model do
  it "trueであるとき、trueになること" do
    expect(true).to eq(true)
  end

  describe "Book#title_with_author" do
    it "Book#title_with_authorを呼び出したとき、titleとauthorを結んだ文字列が返ること" do
      book = Book.new(title: "RubyBook", author: "matz")
      # binding.irb

      expect(book.title_with_author).to eq("RubyBook - matz")
    end
  end

  describe "Book#title_with_author" do
    context "Book#titleが文字列のとき" do
      before do
        @book = Book.new(title: "RubyBook", author: "matz")
      end
      it "titleとauthorを結んだ文字列が返ること" do
        expect(@book.title_with_author).to eq("RubyBook - matz")
      end
    end

    context "Book#titleがnilのとき" do
      it "空のtitleとauthorを結んだ文字列が返ること" do
        book = Book.new(author: "matz")
        expect(book.title_with_author).to eq(" - matz")
      end
    end

    context "Book#titleがnilのとき" do
      subject(:book){ Book.new(author: "matz") } # subjectにbookと名前をつける
      it "空のtitleとauthorを結んだ文字列が返ること" do
        expect(book.title_with_author).to eq(" - matz")
      end
    end
  
    context "Book#titleが文字列のとき" do
      let(:book){ Book.new(title: "RubyBook", author: "matz") }
      it "titleとauthorを結んだ文字列が返ること" do
        expect(book.title_with_author).to eq("RubyBook - matz")
      end
    end
  end

  describe "Book#bonus" do
    context "lucky?がtrueのとき" do
      it "チェキが返ること" do
        book = Book.new
        allow(book).to receive(:lucky?).and_return(true)
        expect(book).to receive(:lucky?)
        expect(book.bonus).to eq("著者サイン入りチェキ")
      end
    end
  end
end
