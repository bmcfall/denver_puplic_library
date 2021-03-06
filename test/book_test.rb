require './test/test_helper'
require './lib/book'

class BookTest < Minitest::Test

  def test_it_exists
    book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})

    assert_instance_of Book, book
  end

  def test_it_has_attributes
    book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})

    assert_equal book.author_first_name, "Harper"
    assert_equal book.author_last_name, "Lee"
    assert_equal book.title, "To Kill a Mockingbird"
    assert_equal book.publication_date, "July 11, 1960"
  end
end
