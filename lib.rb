# The unofficial anachronistic Library of Alexandria

=begin Project description: Use object-oriented Ruby to model a public library (w/ three classes: Library, Shelf, & Book).
The library should be aware of a number of shelves.
Each shelf should know what books it contains.
Make the book object have "enshelf" and "unshelf" methods that control what shelf the book is sitting on.
The library should have a method to report all books it contains.
Note: this should *not* be a Rails app - just a single file with three classes
(plus commands at the bottom showing it works) is all that is needed.
=end

class Library
  attr_accessor :shelves

  def initialize shelves
    @shelves = shelves
  end

  def report
    @shelves.each_with_index do |shelf, i|
      puts "Shelf ##{i}"
      shelf.report
      puts
    end
  end
end

class Shelf
  attr_accessor :books

  def initialize
    @books = []
  end

  def add_book(book)
    @books << book
  end

  def remove_book(book)
    @books.delete(book)
  end

  def report
    @books.each do |book|
      puts book
    end
  end
end


class Book
  attr_accessor :title, :author, :year, :shelf

  def initialize title, author, year, shelf
    @title = title
    @author = author
    @year = year
    enshelf(shelf)
  end

  def to_s
    "#{@title} by #{@author} authored in #{@year}."
  end

  def enshelf(shelf)
    shelf.add_book(self)
    @shelf = shelf
  end

  def unshelf
    @shelf.remove_book(self)
    @shelf = nil
  end
end

#Make a shelf
shelf1 = Shelf.new
shelf2 = Shelf.new

#Make Book instances:
  Book.new("Norwegian Wood", "Haruki Murakami", "1987", shelf1)
  Book.new("Blink", "Malcolm Gladwell", "2005", shelf1)
  Book.new("A Dance with Dragons", "George R. R. Martin", "2011", shelf2)
  lolita = Book.new("Lolita", "Vladimir Nabokov", "1955", shelf2)
  Book.new("The Art of War", "Sun Tzu", "Han Dynasty", shelf2)
  Book.new("On Photography", "Susan Sontag", "1977", shelf2)

#define that the shelves contain books
shelf2.report
lolita.unshelf
#puts lolita on the shelf
puts
shelf2.report
#is lolita on the shelf?
puts lolita.shelf.inspect
p lolita.shelf
puts lolita
p lolita
# Added lolita back on the shelf
puts lolita.enshelf(shelf1)
puts
shelf1.report
puts
#create library and put shelves in it
library = Library.new([shelf1, shelf2])
puts
library.report
