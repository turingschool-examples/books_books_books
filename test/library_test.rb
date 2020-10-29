require "minitest/autorun"
require "minitest/pride"
require "./lib/library.rb"

class Test < Minitest::Test
  def setup
    @library = Library.new("Denver Public Library")
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Library, @library

    assert_equal "Denver Public Library", @library.name
    assert_equal [], @library.books
    assert_equal [], @library.authors
  end
end
