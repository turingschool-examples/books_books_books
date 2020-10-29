require 'minitest/autorun'
require 'minitest/pride'
require './lib/book'
require './lib/author'
require './lib/library'

class LibraryTest < Minitest::Test

  def setup
    @dpl = Library.new("Denver Public Library")
  end

  def test_it_exists
    assert_instance_of Library, @dpl
  end

  def test_it_calls_library_name
    assert_equal "Denver Public Library", @dpl.name
  end

  def test_it_calls_books_with_no_books
    assert_equal [], @dpl.library_books
  end

  def test_it_calls_authors_with_no_authors
    assert_equal [], @dpl.authors
  end

  def test_it_adds_authors
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    @dpl.add_author(charlotte_bronte)
    @dpl.add_author(harper_lee)

    assert_equal [charlotte_bronte, harper_lee], @dpl.authors
    assert_equal 4, @dpl.library_books.flatten.count
  end

  def test_publication_time_frame_for
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    @dpl.add_author(charlotte_bronte)
    @dpl.add_author(harper_lee)

    charlotte_expected = {:start=>"1847", :end=>"1857"}
    assert_equal charlotte_expected, @dpl.publication_time_frame_for(charlotte_bronte)

    harper_expected = {:start=>"1960", :end=>"1960"}
    assert_equal harper_expected, @dpl.publication_time_frame_for(harper_lee)
  end

  def test_checkout
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    jane_eyre = Book.new ({author_first_name: "Charlotte",
                      author_last_name: "Bronte",
                      title: "Jane Eyre",
                      publication_date: "October 16, 1847"})
    mockingbird = Book.new ({author_first_name: "Harper",
                      author_last_name: "Lee",
                      title: "To Kill a Mockingbird",
                      publication_date: "July 11, 1960"})

    refute @dpl.checkout(mockingbird)
    refute @dpl.checkout(jane_eyre)

    @dpl.add_author(charlotte_bronte)
    @dpl.add_author(harper_lee)

    assert @dpl.checkout(jane_eyre)
    refute @dlp.checkout(jane_eyre)
  end


  def test_checked_out_books
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    jane_eyre = Book.new ({author_first_name: "Charlotte",
                      author_last_name: "Bronte",
                      title: "Jane Eyre",
                      publication_date: "October 16, 1847"})
    mockingbird = Book.new ({author_first_name: "Harper",
                      author_last_name: "Lee",
                      title: "To Kill a Mockingbird",
                      publication_date: "July 11, 1960"})
    @dpl.add_author(charlotte_bronte)
    @dpl.add_author(harper_lee)
    @dpl.checkout(jane_eyre)

    assert_equal [jane_eyre], @dpl.checked_out_books
  end

  def test_return
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    jane_eyre = Book.new ({author_first_name: "Charlotte",
                      author_last_name: "Bronte",
                      title: "Jane Eyre",
                      publication_date: "October 16, 1847"})
    mockingbird = Book.new ({author_first_name: "Harper",
                      author_last_name: "Lee",
                      title: "To Kill a Mockingbird",
                      publication_date: "July 11, 1960"})
    @dpl.add_author(charlotte_bronte)
    @dpl.add_author(harper_lee)
    @dpl.checkout(jane_eyre)
    @dpl.return(jane_eyre)

    assert_equal [], @dpl.checked_out_books
  end

  def test_most_popular_book_count
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    jane_eyre = Book.new ({author_first_name: "Charlotte",
                      author_last_name: "Bronte",
                      title: "Jane Eyre",
                      publication_date: "October 16, 1847"})
    mockingbird = Book.new ({author_first_name: "Harper",
                      author_last_name: "Lee",
                      title: "To Kill a Mockingbird",
                      publication_date: "July 11, 1960"})
    @dpl.add_author(charlotte_bronte)
    @dpl.add_author(harper_lee)
    @dpl.checkout(jane_eyre)
    @dpl.return(jane_eyre)

    assert_equal 3, @dpl.most_popular_book_count.count
  end

  def test_most_popular_book
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    jane_eyre = Book.new ({author_first_name: "Charlotte",
                      author_last_name: "Bronte",
                      title: "Jane Eyre",
                      publication_date: "October 16, 1847"})
    mockingbird = Book.new ({author_first_name: "Harper",
                      author_last_name: "Lee",
                      title: "To Kill a Mockingbird",
                      publication_date: "July 11, 1960"})
    @dpl.add_author(charlotte_bronte)
    @dpl.add_author(harper_lee)
    @dpl.checkout(jane_eyre)
    @dpl.return(jane_eyre)

    assert_equal jane_eyre, @dpl.most_popular_book
  end

end
