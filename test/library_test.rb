require './lib/library'
require './lib/author'
require 'minitest/autorun'
require 'pry'

class LibraryTest < Minitest::Test
    def setup
        @dpl = Library.new("Denver Public Library")
    end

    def test_it_exists
        assert_instance_of Library , @dpl
    end
end