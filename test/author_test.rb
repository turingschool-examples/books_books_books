require './lib/book'
require './lib/author'
require 'minitest/autorun'
require 'pry'

class AuthorTest < Minitest::Test
    def setup
        @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    end
    def test_it_exists
        assert_instance_of Author , @charlotte_bronte
    end

    def test_it_has_attributes
        assert_equal "Charlotte" , @charlotte_bronte.first_name
        assert_equal "Bronte" , @charlotte_bronte.last_name
        assert_equal [] , @charlotte_bronte.books
    end

    def test_it_can_return_full_name
        assert_equal "Charlotte Bronte" , @charlotte_bronte.name
    end

    def test_it_can_write_books
        expected = Book.new({author_first_name: "Charlotte",
                             author_last_name: "Bronte",
                             publication_date: "October 16, 1847",
                             title: "Jane Eyre"})

        jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
        assert_equal expected.class , jane_eyre.class
        assert_equal expected.title , jane_eyre.title
    end

    
end