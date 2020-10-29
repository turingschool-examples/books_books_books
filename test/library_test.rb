require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/library'

class LibraryTest < Minitest::Test
  def setup
    @dpl = Library.new("Denver Public Library")
  end

  def test_it_exists	
    assert_instance_of Library, @dpl 
  end
end