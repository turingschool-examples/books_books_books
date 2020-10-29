require "minitest/autorun"
require "minitest/pride"
require "./lib/book"

class BookTest < Minitest::Test
  def test_it_has_attributes
    book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
    assert_equal "To Kill a Mockingbird", book.title
    assert_equal "Harper Lee", book.author
  end
end
