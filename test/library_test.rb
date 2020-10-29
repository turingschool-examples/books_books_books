require 'minitest/autorun'
require 'minitest/pride'
require './lib/author'
require './lib/library'

class LibraryTest < MiniTest::Test

  def test_it_exists_with_attributes
    dpl = Library.new("Denver Public Library")

    assert_instance_of Library, dpl
    assert_equal [], dpl.books
    assert_equal [], dpl.authors
  end

  # def test_it_can_add_author
  #   dpl = Library.new("Denver Public Library")
  #   charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  #   dpl.add_author(charlotte_bronte)
  #   expected = [charlotte_bronte]
  #
  #   assert_equal expected, dpl.authors
  # end
end
