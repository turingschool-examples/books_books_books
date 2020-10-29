require "minitest/autorun"
require "minitest/pride"
require './lib/author'
require './lib/book'

class AuthorTest < Minitest::Test
  def setup
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end

  def test_it_exists
    assert_instance_of Author, @charlotte_bronte
  end

  def test_it_has_attributes
    assert_equal "Charlotte Bronte", @charlotte_bronte.name
    assert_equal [], @charlotte_bronte.books
  end

  def test_write
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")

    assert_instance_of Book, jane_eyre
    assert_equal "Jane Eyre", jane_eyre.title

    villete = @charlotte_bronte.write("Villette", "1853")

    assert_equal [jane_eyre, villete], @charlotte_bronte.books
  end

  def test_first_book
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = @charlotte_bronte.write("The Professor", "1857")
    villete = @charlotte_bronte.write("Villette", "1853")

    assert_equal "1847", @charlotte_bronte.first_book_published
  end

  def test_last_book
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = @charlotte_bronte.write("The Professor", "1857")
    villete = @charlotte_bronte.write("Villette", "1853")

    assert_equal "1857", @charlotte_bronte.last_book_published
  end
end
