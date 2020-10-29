require 'minitest/autorun'
require 'minitest/pride'
require './lib/book'
require './lib/author'
require './lib/library'

class LibraryTest < Minitest::Test
  def test_it_exists_and_has_attributes
    dpl = Library.new("Denver Public Library")

    assert_instance_of Library, dpl
    assert_equal "Denver Public Library", dpl.name
    assert_equal [], dpl.books
    assert_equal [], dpl.authors
  end

  def test_it_can_add_authors
    dpl = Library.new("Denver Public Library")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)

    assert_equal [charlotte_bronte, harper_lee], dpl.authors
    assert_equal 4, dpl.books.length
  end

  def test_it_can_check_publication_time_frame_for
    dpl = Library.new("Denver Public Library")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)

    expected = {:start=>"1847", :end=>"1857"}
    assert_equal expected, dpl.publication_time_frame_for(charlotte_bronte)

    expected = {:start=>"1960", :end=>"1960"}
    assert_equal expected, dpl.publication_time_frame_for(harper_lee)
  end

  def test_it_can_have_book_dates
    dpl = Library.new("Denver Public Library")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    villette = charlotte_bronte.write("Villette", "1853")
    dpl.add_author(charlotte_bronte)

    expected = ["1847", "1853"]

    assert_equal expected, dpl.book_dates_for(charlotte_bronte)
  end

  def test_it_can_calculate_time_frame
    dpl = Library.new("Denver Public Library")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)

    expected = {:start=>"1847", :end=>"1857"}
    assert_equal expected, dpl.time_frame(["1847", "1857"])
  end

  def test_it_can_checkout
    dpl = Library.new("Denver Public Library")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    assert_equal false, dpl.checkout(mockingbird)

    dpl.add_author(charlotte_bronte)

    assert dpl.checkout(jane_eyre)
    assert_equal [jane_eyre], dpl.checked_out_books
    assert_equal false, dpl.checkout(jane_eyre)
  end

  def test_it_can_return
    dpl = Library.new("Denver Public Library")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    dpl.add_author(charlotte_bronte)
    dpl.checkout(jane_eyre)
    dpl.return(jane_eyre)

    assert_equal [], dpl.checked_out_books
    assert dpl.checkout(jane_eyre)
  end

  def test_it_can_calculate_most_popular_book
    dpl = Library.new("Denver Public Library")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)
    dpl.checkout(jane_eyre)
    dpl.return(jane_eyre)
    dpl.checkout(jane_eyre)
    dpl.checkout(villette)
    dpl.checkout(mockingbird)
    dpl.return(mockingbird)
    dpl.checkout(mockingbird)
    dpl.return(mockingbird)
    dpl.checkout(mockingbird)

    assert_equal mockingbird, dpl.most_popular_book
  end

  def test_it_can_check_times_checked_out
    dpl = Library.new("Denver Public Library")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)
    dpl.checkout(jane_eyre)
    dpl.return(jane_eyre)
    dpl.checkout(jane_eyre)
    dpl.checkout(villette)
    dpl.checkout(mockingbird)
    dpl.return(mockingbird)
    dpl.checkout(mockingbird)
    dpl.return(mockingbird)
    dpl.checkout(mockingbird)

    assert_equal 3, dpl.times_checked_out_increment(jane_eyre)
  end
end