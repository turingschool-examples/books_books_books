require 'minitest/autorun'
require 'minitest/pride'
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
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})

    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)

    expected1 = [charlotte_bronte, harper_lee]
    assert_equal expected1, dpl.authors
  end

  def test_it_can_find_books
    dpl = Library.new("Denver Public Library")

    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")

    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)

    expected = [jane_eyre, professor, villette, mockingbird]
    assert_equal expected, dpl.books
  end

  def test_publication_time_frame
    dpl = Library.new("Denver Public Library")

    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")

    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)

    expected1 = {:start=>"1847", :end=>"1857"}
    expected2 = {:start=>"1960", :end=>"1960"}
    assert_equal expected1, dpl.publication_time_frame_for(charlotte_bronte)
    assert_equal expected2, dpl.publication_time_frame_for(harper_lee)
  end
end
