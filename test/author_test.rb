require "minitest/autorun"
require "minitest/pride"
require "./lib/author.rb"

class AuthorTest < Minitest::Test
  def setup
    @author = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Author, @author

    assert_equal "Charlotte Bronte", @author.name
    assert_equal [], @author.books
  end

  def test_it_can_write_books
    assert_equal [], @author.books
    book1 = @author.write("Jane Eyre", "October 16, 1847")
    assert_equal [book1], @author.books
    book2 = charlotte_bronte.write("Villette", "1853")
    assert_equal [book1, book2], @author.books

    assert_instance_of Book, book1
    assert_equal "Jane Eyre", book1.title
    assert_equal "1847", book1.title
    assert_equal "Charlotte Bronte", book1.author
  end
end
