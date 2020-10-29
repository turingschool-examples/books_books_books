require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/book'
require './lib/author'
require './lib/library'

class LibraryTest < Minitest::Test
    def setup
        @dpl = Library.new("Denver Public Library")
        @charlotte_bronte = Author.new({
            first_name: "Charlotte",
            last_name: "Bronte"}
        )
        @harper_lee = Author.new({
            first_name: "Harper", 
            last_name: "Lee"
            }
        )
        @jane_eyre = @charlotte_bronte.write(
            "Jane Eyre", 
            "October 16, 1847"
        )
        @professor = @charlotte_bronte.write(
            "The Professor",
            "1857"
        )
        @villette = @charlotte_bronte.write(
            "Villette",
            "1853"
        )
        @mockingbird = @harper_lee.write(
            "To Kill a Mockingbird", 
            "July 11, 1960"
        )
    end

    def test_it_exists_and_has_attributes
        assert_instance_of Library, @dpl
        assert_equal "Denver Public Library", @dpl.name
        assert_equal [], @dpl.books
        assert_equal [], @dpl.authors
    end

    def test_it_can_add_authors
        @dpl.add_author(@charlotte_bronte)
        @dpl.add_author(@harper_lee)

        expected_1 = [@charlotte_bronte, @harper_lee]
        expected_2 = [@jane_eyre, @professor, @villette, @mockingbird]

        assert_equal expected_1, @dpl.authors
        assert_equal expected_2, @dpl.books
    end

    def test_it_can_return_publication_time_frame_by_author
        @dpl.add_author(@charlotte_bronte)
        @dpl.add_author(@harper_lee)

        expected_1 = {:start=>"1847", :end=>"1857"}
        expected_2 = {:start=>"1960", :end=>"1960"}

        assert_equal expected_1, @dpl.publication_time_frame_for(@charlotte_bronte)        
        assert_equal expected_2, @dpl.publication_time_frame_for(@harper_lee)
    end

end