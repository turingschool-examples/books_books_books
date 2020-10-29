require 'minitest/autorun'
require './lib/book'
require './lib/author'

class Test < MiniTest::Test

    def test_author_can_instantiate_with_attributes
        charlotte_bronte = Author.new({
            first_name: "Charlotte",
            last_name: "Bronte"
            })
        
        assert_equal "Charlotte Bronte", charlotte_bronte.name
        assert_equal [], charlotte_bronte.books
    end

end