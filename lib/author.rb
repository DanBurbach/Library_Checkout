require'pg'


DB = PG.connect({:dbname => 'library'})

class Author
  attr_accessor(:name, :books)
  attr_reader(:id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @books = attributes.fetch(:books)
    @id = attributes.fetch(:id).to_i rescue nil
  end

  def self.all
    returned_authors = DB.exec("SELECT * FROM author;")
    authors = []
    returned_authors.each() do |author|
      name = author.fetch("name")
      books = author.fetch("books")
      id = author.fetch("id").to_i()
      authors.push(Author.new({:name => name, :books => books, :id => id}))
    end
    authors
  end

  def self.find(id)
    returned_authors = DB.exec("SELECT * FROM author WHERE id = #{id};")
    returned_authors.each() do |author|
      name = author.fetch("name")
      books = author.fetch("books")
      id = author.fetch("id").to_i()
      return Author.new({:name => name, :books => books, :id => id})
    end
  end

  def save
    result = DB.exec("INSERT INTO author(name, books, id) VALUES ('#{@name}','#{@books}', #{@id}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def ==(another_author)
    self.name().==(another_author.name()).&(self.books().==(another_author.books()))
  end

  def Delete(id)
    DB.exec("DELETE FROM authors_tb WHERE id = #{author.id};")
  end
end
