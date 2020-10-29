require "minitest/autorun"
require "minitest/pride"
require "./lib/library.rb"
require "./lib/author.rb"

class Test < Minitest::Test
  def setup
    @library = Library.new("Denver Public Library")

    @author1 = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    @book1 = @author1.write("Jane Eyre", "October 16, 1847")
    @book2 = @author1.write("The Professor", "1857")
    @book3 = @author1.write("Villette", "1853")

    @author2 = Author.new({first_name: "Harper", last_name: "Lee"})
    @book4 = @author2.write("To Kill a Mockingbird", "July 11, 1960")
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Library, @library

    assert_equal "Denver Public Library", @library.name
    assert_equal [], @library.authors
    assert_equal [], @library.checked_out_books
  end

  def test_it_adds_authors
    assert_equal [], @library.authors
    @library.add_author(@author1)
    @library.add_author(@author2)
    assert_equal [@author1, @author2], @library.authors
  end

  def test_it_has_books
    @library.add_author(@author1)
    @library.add_author(@author2)
    assert_equal [@book1, @book2, @book3, @book4], @library.books
  end

  def test_it_has_publication_time_frame_for
    expected1 = {:start=>"1847", :end=>"1857"}
    expected2 = {:start=>"1960", :end=>"1960"}

    assert_equal expected1, @library.publication_time_frame_for(@author1)
    assert_equal expected2, @library.publication_time_frame_for(@author2)
  end

  def test_it_can_checkout_books
    assert_equal false, @library.checkout(@book1) #doesn't exist
    @library.add_author(@author1)
    @library.add_author(@author2)
    assert_equal true, @library.checkout(@book1) #exists and is free, true case
    assert_equal false, @library.checkout(@book1) #has already been checked out

    assert_equal true, @library.checkout(@book2) #exists and is free, true case
  end

  def test_checkout_helpers
    assert_equal false, @library.book_exists(@book1)
    assert_equal true, @library.book_is_free(@book1)
    @library.add_author(@author1)
    assert_equal true, @library.book_exists(@book1)
    assert_equal true, @library.book_is_free(@book1)
    @library.checkout(@book1)
    assert_equal true, @library.book_exists(@book1)
    assert_equal false, @library.book_is_free(@book1)
  end

  def test_add_popularity_and_most_popular_book
    @library.add_popularity(@book1)
    assert_equal @book1, @library.most_popular_book
    @library.add_popularity(@book2)
    @library.add_popularity(@book2)
    assert_equal @book2, @library.most_popular_book
  end
end
