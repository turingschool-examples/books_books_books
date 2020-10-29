require require 'minitest/autorun'
require './lib/book'

class BookTest < MiniTest::Test
    
    def test_book_can_instantiate_with_attributes
        book = Book.new({
            author_first_name: "Harper",
            author_last_name: "Lee",
            title: "To Kill a Mockingbird",
            publication_date: "July 11, 1960"
        })

        assert_equal "To Kill a Mockingbird", book.title
        assert_equal "Harper Lee", book.author
        assert_equal "1960", book.publication_year
    end
end