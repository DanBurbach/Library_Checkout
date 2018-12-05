require'pg'
require'pry'


DB = PG.connect({:dbname => 'library'})

class Patron
  attr_accessor(:name, :checkout_books)
  attr_reader(:id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @checkout_books = attributes.fetch(:checkout_books)
    @id = attributes.fetch(:id).to_i rescue nil
  end

  def self.all
    returned_patrons = DB.exec("SELECT * FROM patron;")
    patrons = []
    returned_patrons.each() do |patron|
      name = patron.fetch("name")
      checkout_books = patron.fetch("checkout_books")
      id = patron.fetch("id").to_i()
      patrons.push(Patron.new({:name => name, :checkout_books => checkout_books, :id => id}))
    end
    patrons
  end

  def self.find(id)
    returned_patrons = DB.exec("SELECT * FROM patron WHERE id = #{id};")
    returned_patrons.each() do |patron|
      name = patron.fetch("name")
      checkout_books = patron.fetch("checkout_books")
      id = patron.fetch("id").to_i()
      return Patron.new({:name => name, :checkout_books => checkout_books, :id => id})
    end
  end

  def save
    result = DB.exec("INSERT INTO patron (name, checkout_books, id) VALUES ('#{@name}','#{@checkout_books}', #{@id}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def ==(another_patron)
    self.name().==(another_patron.name()).&(self.checkout_books().==(another_patron.checkout_books())).&(self.id().==(another_patron.id()))
  end

  def Delete(id)
    DB.exec("DELETE FROM patron WHERE id = #{patron.id};")
  end
end
