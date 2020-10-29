require "minitest/autorun"
require "minitest/pride"
require "./lib/library"
require "./lib/author"

class LibraryTest < Minitest::Test
  def test_it_exists_and_has_attributes
    dpl = Library.new("Denver Public Library")
    assert_instance_of Library, dpl
    assert_equal "Denver Public Library", dpl.name
    assert_equal [], dpl.books
    assert_equal [], dpl.authors
  end

end
