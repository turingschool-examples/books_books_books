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
        skip
    end

end