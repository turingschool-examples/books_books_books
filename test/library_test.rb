require "minitest/autorun"
require "minitest/pride"
require "./lib/library"
require "./lib/author"
require "./lib/book"

class LibraryTest < Minitest::Test
  def setup
    @dpl = Library.new("Denver Public Library")
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    @professor = @charlotte_bronte.write("The Professor", "1857")
    @villette = @charlotte_bronte.write("Villette", "1853")
    @harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    @mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Library, @dpl
    assert_equal "Denver Public Library", @dpl.name
  end

  def test_it_can_add_books_and_authors
    assert_equal [], @dpl.books
    assert_equal [], @dpl.authors
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)

    @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    @professor = @charlotte_bronte.write("The Professor", "1857")
    @villette = @charlotte_bronte.write("Villette", "1853")

    assert_equal [@charlotte_bronte, @harper_lee], @dpl.authors
    assert_equal [@jane_eyre, @professor, @villette, @mockingbird], @dpl.books
  end
end
