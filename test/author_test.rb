require './test/test_helper'
require './lib/author'
require './lib/book'

class AuthorTest < Minitest::Test

  def test_it_exists
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    assert_instance_of Author, charlotte_bronte
  end

  def test_it_has_attributes
    book = Book.new({author_first_name: "Charlotte", author_last_name: "Bronte", title: "Jane Eyre", publication_date: "1847"})
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    assert charlotte_bronte.books.empty?
    charlotte_bronte.add_book(book)
    refute charlotte_bronte.books.empty?
    assert charlotte_bronte.books
    assert_instance_of Book, charlotte_bronte.books[0]
    assert_equal charlotte_bronte.books.count, 1
    assert_equal charlotte_bronte.books[0].author_first_name, "Charlotte"
  end

end
