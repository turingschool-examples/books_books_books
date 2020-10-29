require "minitest/autorun"
require "minitest/pride"
require "./lib/book"
require "./lib/author"
require "pry"

class AuthorTest < Minitest::Test
  def setup
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end

  def test_it_exists

    assert_instance_of Author, @charlotte_bronte
  end

  def test_attributes

    assert_equal "Charlotte Bronte", @charlotte_bronte.name
    assert_equal [], @charlotte_bronte.books
  end

  def test_author_writes_books

    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")

    assert_equal Book, jane_eyre.class
    assert_equal "Jane Eyre", jane_eyre.title

    villette = @charlotte_bronte.write("Villette", "1853")
    #^This, this right here. I am SO MAD about this. this makes no sense.
    #where were we taught this? because I cannot for the life of me remember how to
    # store an object upon creation in a method in another class. if I try to shovel it into the
    # @books array it tell me that my Book is now an Array wtf??
    # I stayed up til 1:30 PERFECTING iteration 4 on both
    #boat_rental and colorado_lottery, and I've hit an impassable
    #road block in iteration 2 on the test? are you kidding me?
    #this makes me so upset. this is so incredibly disheartening.

    @charlotte_bronte.add_book(jane_eyre)
    @charlotte_bronte.add_book(villette)
    assert_equal [jane_eyre, villette], @charlotte_bronte.books
  end

  def
end
