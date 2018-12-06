require'pg'
require'pry'


DB = PG.connect({:dbname => 'library'})

class Book
  attr_accessor(:title, :author, :status)
  attr_reader(:id)

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @author = attributes.fetch(:author)
    @status = attributes.fetch(:status)
    @id = attributes.fetch(:id).to_i rescue nil
  end

  def self.all
    returned_books = DB.exec("SELECT * FROM book;")
    books = []
    returned_books.each() do |book|
      title = book.fetch("title")
      author = book.fetch("author")
      status = book.fetch("status")
      # check to see if status needs to be an Integer
      id = book.fetch("id").to_i()
      books.push(Book.new({:title => title, :author => author, :status => status, :id => id}))
    end
    books
  end

  def self.find(id)
    returned_books = DB.exec("SELECT * FROM book WHERE id = #{id};")
    returned_books.each() do |book|
      title = book.fetch("title")
      author = book.fetch("author")
      status = book.fetch("status")
      id = book.fetch("id").to_i()
      return Book.new({:title => title, :author => author, :status => status, :id => id})
    end
  end

  def self.sort(status)
    returned_books = DB.exec("SELECT * FROM book WHERE status = '#{status}';")
    books = []
    returned_books.each() do |book|
      title = book.fetch("title")
      author = book.fetch("author")
      status = book.fetch("status")
      id = book.fetch("id").to_i()
      books.push(Book.new({:title => title, :author => author, :status => status, :id => id}))
    end
    books
  end

  def save
    result = DB.exec("INSERT INTO book(title, author, status) VALUES ('#{@title}','#{@author}', '#{@status}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def update(attributes)
    @status = attributes.fetch(:status)
    @id = self.id()
    DB.exec("UPDATE book SET status = '#{@status}' WHERE id = #{@id};")
  end

  def delete()
    returned_books = DB.exec("DELETE FROM book WHERE id = #{self.id()};")
  end

  def ==(another_book)
    (self.title().==(another_book.title())).&(self.author().==(another_book.author())).&(self.status().==(another_book.status())).&(self.id().==(another_book.id()))
  end
end
