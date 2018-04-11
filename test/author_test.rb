require './test/test_helper'
require './lib/author'
require './lib/book'

class AuthorTest < Minitest::Test

  def test_it_exists
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    assert_instance_of Author, charlotte_bronte
  end

  def test_it_has_attributes
    author = Author.new({first_name: "Wally", last_name: "Lamb"})

    assert_equal = author.attributes, ({first_name: "Wally", last_name: "Lamb"})
    assert_equal author.books, []
  end

  def test_it_can_add_books
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

  def test_it_can_add_books_with_title_publication_date
    book1 = Book.new({author_first_name: "Charlotte", author_last_name: "Bronte", title: "Jane Eyre", publication_date: "1847"})
    book2 = Book.new({title: "Jane Eyre", publication_date: "October 16, 1847"})
    book3 = Book.new ({title: "Villette", publication_date: "1853"})
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    assert charlotte_bronte.books.empty?
    charlotte_bronte.add_book(book1)
    refute charlotte_bronte.books.empty?
    charlotte_bronte.add_book(book2)
    refute charlotte_bronte.books.empty?
    charlotte_bronte.add_book(book3)
    refute charlotte_bronte.books.empty?
    assert charlotte_bronte.books
    assert_instance_of Book, charlotte_bronte.books[2]
    assert_equal charlotte_bronte.books.count, 3
    assert_equal charlotte_bronte.books[0].publication_date, "1847"
    assert_equal charlotte_bronte.books[1].publication_date, "October 16, 1847"
    assert_equal charlotte_bronte.books[2].publication_date, "1853"

  end
end
