require 'minitest/autorun'
require 'minitest/pride'
require './lib/library'
require './lib/author'
require './lib/book'
class LibraryTest < Minitest::Test

  def setup
    @dpl = Library.new("Denver Public Library")
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Library, @dpl
    assert_equal "Denver Public Library", @dpl.name
    assert_equal [], @dpl.books
    assert_equal [], @dpl.authors
  end
end
