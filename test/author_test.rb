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
        expected_1 = Book.new({author_first_name: "Charlotte",
                             author_last_name: "Bronte",
                             publication_date: "October 16, 1847",
                             title: "Jane Eyre"})

        expected_2 = Book.new({author_first_name: "Charlotte",
                               author_last_name: "Bronte",
                               publication_date: "1853",
                               title: "Villette"})

        jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
        villette = @charlotte_bronte.write("Villette", "1853")

        
        assert_equal expected_1.class , jane_eyre.class
        assert_equal expected_1.title , jane_eyre.title

        assert_equal expected_2.class , villette.class
        assert_equal expected_2.title , villette.title


    end

    def test_it_can_add_books
        jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
        villette = @charlotte_bronte.write("Villette", "1853")

        assert_equal [jane_eyre , villette] , @charlotte_bronte.books
    end


end