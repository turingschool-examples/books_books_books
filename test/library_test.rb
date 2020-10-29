require './lib/library'
require './lib/author'
require 'minitest/autorun'
require 'pry'

class LibraryTest < Minitest::Test

    def setup
        @dpl = Library.new("Denver Public Library")
        @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
        @harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})    
        @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847") 
        @villette = @charlotte_bronte.write("Villette", "1853") 
        @professor = @charlotte_bronte.write("The Professor", "1857") 
        @mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")    
    end

    def test_it_exists
        assert_instance_of Library , @dpl
    end

    def test_it_has_attributes
        assert_equal "Denver Public Library" , @dpl.name
        assert_equal [] , @dpl.books
        assert_equal [] , @dpl.authors
    end

    def test_it_can_add_authors
        @dpl.add_author(@charlotte_bronte)
        @dpl.add_author(@harper_lee) 

        assert_equal [@charlotte_bronte , @harper_lee] , @dpl.authors
    end

    def test_it_adds_each_authors_books
        @dpl.add_author(@charlotte_bronte)
        @dpl.add_author(@harper_lee) 

        assert_instance_of Book, @dpl.books[0]
        assert_instance_of Book, @dpl.books[-1]
    end

    def test_it_can_return_timeframe
        expected_timeframe_char = {:start=>"1847",
                                   :end=>"1857"}
        
        expected_timeframe_harper = {:start=>"1960",
                                     :end=>"1960"}

        @dpl.add_author(@charlotte_bronte)
        @dpl.add_author(@harper_lee)
        
        assert_equal expected_timeframe_char , @dpl.publication_time_frame_for(@charlotte_bronte)
        assert_equal expected_timeframe_harper , @dpl.publication_time_frame_for(@harper_lee)
    end
end