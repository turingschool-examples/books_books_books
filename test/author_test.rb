require 'minitest/autorun'
require './lib/book'
require './lib/author'

class Test < MiniTest::Test

    def setup
        @charlotte_bronte = Author.new({
            first_name: "Charlotte",
            last_name: "Bronte"
            })
    end

    def test_author_can_instantiate_with_attributes
        assert_equal "Charlotte Bronte", @charlotte_bronte.name
        assert_equal [], @charlotte_bronte.books
    end

    def test_author_can_write_a_book
        jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
        
        assert_equal Book, jane_eyre.class
        assert_equal "Jane Eyre", jane_eyre.title
        assert_equal [jane_eyre], @charlotte_bronte.books

        villette = @charlotte_bronte.write("Villette", "1853")

        assert_equal [jane_eyre, villette], @charlotte_bronte.books
    end

end