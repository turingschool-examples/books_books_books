require 'minitest/autorun'
require 'minitest/pride'
require './lib/book'
require './lib/author'

class AuthorTest < Minitest::Test
  def test_it_exists_and_has_attributes
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    assert_instance_of Author, charlotte_bronte
    assert_equal "Charlotte Bronte", charlotte_bronte.name
    assert_equal [], charlotte_bronte.books
  end

  def test_it_knows_book_written
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    book2 = Book.new({author_first_name: "Charlotte",
                      author_last_name: "Bronte",
                      title: "Jane Eyre",
                      publication_date: "October 16, 1847"})

    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")

    assert_equal book2, charlotte_bronte.write("Jane Eyre", "October 16, 1847")
  end
end
