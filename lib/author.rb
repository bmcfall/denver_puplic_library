class Author

  attr_reader :attributes,
              :books

  def initialize(attributes)
    @authors = attributes
    @books = []
  end

  def add_book(book)
    @books << book
  end

end
