require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/book'

class BookCLASS < Minitest::Test
    def setup
        @book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
    end

    def test_it_exsist_and_has_attributes

        assert_instance_of Book, @book
    end

    def test_publication_date

        assert_equal "1960", @book.publication_year
    end
end