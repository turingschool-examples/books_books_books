require 'minitest/autorun'
require './lib/library'
require './lib/author'
require './lib/book'

class Test < MiniTest::Test

    def setup
        @dpl = Library.new("Denver Public Library")
    end

    def test_library_can_instantiate_with_attributes
        assert_equal "Denver Public Library", @dpl.name
        assert_equal [], @dpl.books
        assert_equal [], @dpl.authors
    end

end