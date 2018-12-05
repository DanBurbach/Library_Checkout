require'pg'
require'pry'


DB = PG.connect({:dbname => 'library'})

class Checkout
  attr_accessor(:patron, :book_id, :duedate)
  attr_reader(:id)

  def initialize(attributes)
    @patron = attributes.fetch(:patron)
    @book_id = attributes.fetch(:book_id)
    @duedate = attributes.fetch(:duedate)
    @id = attributes.fetch(:id).to_i rescue nil
  end

  def self.all
    returned_checkout = DB.exec("SELECT * FROM checkout;")
    checkouts = []
    returned_checkout.each() do |checkout|
      patron = checkout.fetch("patron")
      book_id = checkout.fetch("book_id").to_i
      duedate = checkout.fetch("duedate")
      id = checkout.fetch("id").to_i()
      checkouts.push(Checkout.new({:patron => patron, :book_id => book_id, :duedate => duedate, :id => id}))
    end
    checkouts
  end

  def self.find(id)
    returned_checkout = DB.exec("SELECT * FROM checkout WHERE id = #{id};")
    returned_checkout.each() do |checkout|
      patron = checkout.fetch("patron")
      book_id = checkout.fetch("book_id").to_i
      duedate = checkout.fetch("duedate")
      id = checkout.fetch("id").to_i()
      return Checkout.new({:patron => patron, :book_id => book_id, :duedate => duedate, :id => id})
    end
  end


#sort by status and in ruby get list base on duedate
  def self.sort()
    time = Time.new()
    new_time = time.strftime('%Y-%m-%d')
    returned_checkout = DB.exec("SELECT * FROM checkout ORDER BY duedate;")
    checkouts = []
    returned_checkout.each() do |checkout|
      patron = checkout.fetch("patron")
      book_id = checkout.fetch("book_id").to_i
      duedate = checkout.fetch("duedate")
      id = checkout.fetch("id").to_i()
      checkouts.push(Checkout.new({:patron => patron, :book_id => book_id, :duedate => duedate, :id => id}))
    end
    return checkouts
  end

  def save
    result = DB.exec("INSERT INTO checkout(patron, book_id, duedate, id) VALUES ('#{@patron}','#{@book_id}', '#{@duedate}', #{@id}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def ==(another_checkout)
    self.patron().==(another_checkout.patron()).&(self.id().==(another_checkout.id())).&(self.book_id().==(another_checkout.book_id())).&(self.duedate().==(another_checkout.duedate()))
  end

  def Delete(id)
    DB.exec("DELETE FROM checkout WHERE id = #{checkout.id};")
  end
end
