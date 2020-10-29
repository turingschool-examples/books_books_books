require 'minitest/autorun'
require 'minitest/pride'
require './lib/book'
require './lib/author'

class AuthorTest < Minitest::Test

  def setup
    @charlotte_bronte = Author.new({first_name: "Charlotte",
                                   last_name: "Bronte"})
  end

  def test_it_exists
    assert_instance_of Author, @charlotte_bronte
  end

  def test_it_calls_author_name
    assert_equal "Charlotte Bronte", @charlotte_bronte.name
  end

  def test_it_calls_books_with_no_books
    assert_equal [], @charlotte_bronte.books
  end

  def test_author_writes_books
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    assert_equal jane_eyre, @charlotte_bronte.books
    assert_equal "Jane Eyre", @charlotte_bronte.books[0].title
    assert_equal Book, @charlotte_bronte.books[0].class

    villette = @charlotte_bronte.write("Villette", "1853")
    assert_equal 2, @charlotte_bronte.books.count
    assert_equal "Villette", @charlotte_bronte.books[1].title
    assert_equal Book, @charlotte_bronte.books[1].class
  end




end
