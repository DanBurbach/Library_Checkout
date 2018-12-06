require 'spec_helper'

  describe(Book) do
    describe(".all") do
    it("is empty at first") do
      expect(Book.all()).to(eq([]))
    end
  end

  describe('#initialize') do
    it('will create a new instance of Book') do
      book = Book.new({:title => 'Mow lawn', :author => 'Mow the front lawn soon!', :status => "t", :id => nil})
      book.save
      expect(book.title).to(eq('Mow lawn'))
      expect(book.author).to(eq('Mow the front lawn soon!'))
      expect(book.status).to(eq("t"))
      #expect(book.set_up_date).to(eq(Time.now)) was returning in error due to computer processing time
      expect(book.id).to(be_an_instance_of(Integer))
    end
  end

  describe('#save') do
    it('save the book to the list of books') do
      book = Book.new({:title => 'Mow lawn', :author => 'Mow the front lawn soon!', :status => "t", :id => nil})
      book.save
      expect(Book.all).to(eq([book]))
    end
  end

  describe("#==") do
    it("is the same book if it has the same title and author and status") do
      book1 = Book.new({:title => 'Mow lawn', :author => 'Mow the front lawn soon!', :status => "t", :id => 1})
      book2 = Book.new({:title => 'Mow lawn', :author => 'Mow the front lawn soon!', :status => "t", :id => 1})
      expect(book1).to(eq(book2))
    end
  end

  describe(".sort") do
    it("will sort the books by due date") do
      book1 = Book.new({:title => 'Do homework', :author => 'Finish math and science assignment!', :status => "f", :id => 1})
      book1.save
      book2 = Book.new({:title => 'Mow lawn', :author => 'Mow the front lawn soon!', :status => "t", :id => 2})
      book2.save
      book3 = Book.new({:title => 'Fix roof', :author => 'Fix leaky roof!', :status => "t", :id => 3})
      book3.save
      expect(Book.sort("t")).to(eq([book2, book3]))
    end
  end

  describe(".find") do
    it("find a book based on id") do
      book1 = Book.new({:title => 'Do homework', :author => 'Finish math and science assignment!', :status => "t", :id => nil})
      book1.save
      book2 = Book.new({:title => 'Mow lawn', :author => 'Mow the front lawn soon!', :status => "t", :id => nil})
      book2.save
      id = book1.id
      expect(Book.find(id)).to(eq(book1))
    end
  end

  describe("#update") do
    it("lets you update status in the database") do
      book = Book.new({:title => 'Mow lawn', :author => 'Mow the front lawn soon!', :status => "t", :id => nil})
      book.save()
      book.update({:status => "f"})
      expect(book.status()).to(eq("f"))
    end
  end

  describe("#delete") do
    it("lets you delete a book from the database") do
      book1 = Book.new({:title => 'Do homework', :author => 'Finish math and science assignment!', :status => "t", :id => 1})
      book1.save
      book2 = Book.new({:title => 'Procrastination', :author => 'I dont wanna do it!', :status => "f", :id => 2})
      book2.save
      book1.delete()
      expect(Book.all()).to(eq([book2]))
    end
  end

  # describe(".find_by_list") do
  #   it("find a book based on list id") do
  #     book1 = Book.new({:title => 'Do homework', :author => 'Finish math and science assignment!', :status => "t", :id => nil})
  #     book1.save
  #     book2 = Book.new({:title => 'Mow lawn', :author => 'Mow the front lawn soon!', :status => "t", :id => nil, :list_id => 2})
  #     book2.save
  #     expect(Book.find_by_list(2)).to(eq([book2]))
  #   end
  # end
end
