require 'minitest/autorun'
require './lib/library'
require './lib/author'
require './lib/book'

class Test < MiniTest::Test

    def setup
        @dpl = Library.new("Denver Public Library")
        @charlotte_bronte = Author.new({
            first_name: "Charlotte",
            last_name: "Bronte"
            })
        @harper_lee = Author.new({
            first_name: "Harper",
            last_name: "Lee"
            })
        @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
        @professor = @charlotte_bronte.write("The Professor", "1857") 
        @villette = @charlotte_bronte.write("Villette", "1853")
        @mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    end

    def test_library_can_instantiate_with_attributes
        assert_equal "Denver Public Library", @dpl.name
        assert_equal [], @dpl.books
        assert_equal [], @dpl.authors
        assert_equal [], @dpl.checked_out_books
    end

    def test_library_can_add_authors_and_update_attributes
        @dpl.add_author(@charlotte_bronte)
        @dpl.add_author(@harper_lee)

        assert_equal [@charlotte_bronte, @harper_lee], @dpl.authors
        assert_equal [@jane_eyre, @professor, @villette, @mockingbird], @dpl.books
    end

    def test_publication_time_frame_for_author
        @dpl.add_author(@charlotte_bronte)
        @dpl.add_author(@harper_lee)

        expected_bronte = {start: "1847", end: "1857"}
        expected_lee = {start: "1960", end: "1960"}
        assert_equal expected_bronte, @dpl.publication_time_frame_for(@charlotte_bronte)
        assert_equal expected_lee, @dpl.publication_time_frame_for(@harper_lee)
    end

    def test_library_can_checkout_book
        assert_equal false, @dpl.checkout(@mockingbird)
        assert_equal false, @dpl.checkout(@jane_eyre)

        @dpl.add_author(@charlotte_bronte)
        @dpl.add_author(@harper_lee)
        
        assert_equal true, @dpl.checkout(@jane_eyre)
        assert_equal [@jane_eyre], @dpl.checked_out_books
        assert_equal false, @dpl.checkout(@jane_eyre)
    end
end