require './test/test_helper'
require './lib/library'

class LibraryTest < Minitest::Test

  def test_it_has_an_instance

    library = Library.new

    assert_instance_of Library, library

  end
end
