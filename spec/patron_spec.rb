require 'spec_helper'

  describe(Patron) do
    describe(".all") do
    it("is empty at first") do
      expect(Patron.all()).to(eq([]))
    end
  end

  describe('#initialize') do
    it('will create a new instance of Patron') do
      patron = Patron.new({:name => 'Mow lawn', :checkout_books => 'Mow the front lawn soon!', :id => nil})
      patron.save
      expect(patron.name).to(eq('Mow lawn'))
    end
  end

  describe('#save') do
    it('save the patron to the list of patrons') do
      patron = Patron.new({:name => 'Mow lawn', :checkout_books => 'Mow the front lawn soon!', :id => nil})
      patron.save
      expect(Patron.all).to(eq([patron]))
    end
  end

  describe("#==") do
    it("is the same patron if it has the same name and list ID") do
      patron1 = Patron.new({:name => 'Mow lawn', :checkout_books => 'Mow the front lawn soon!', :id => 1})
      patron2 = Patron.new({:name => 'Mow lawn', :checkout_books => 'Mow the front lawn soon!', :id => 1})
      expect(patron1).to(eq(patron2))
    end
  end

  # describe(".sort") do
  #   it("will sort the patrons by due date") do
  #     patron1 = Patron.new({:name => 'Do homework', :checkout_books => 'Finish math and science assignment!', :id => 1})
  #     patron1.save
  #     patron2 = Patron.new({:name => 'Mow lawn', :checkout_books => 'Mow the front lawn soon!', :id => 1})
  #     patron2.save
  #     patron3 = Patron.new({:name => 'Fix roof', :checkout_books => 'Fix leaky roof!', :id => 1})
  #     patron3.save
  #     expect(Patron.sort).to(eq([patron3, patron2, patron1]))
  #   end
  # end

  describe(".find") do
    it("find a patron based on id") do
      patron1 = Patron.new({:name => 'Do homework', :checkout_books => 'Finish math and science assignment!', :id => 1})
      patron1.save
      patron2 = Patron.new({:name => 'Mow lawn', :checkout_books => 'Mow the front lawn soon!', :id => 2})
      patron2.save
      id = patron1.id
      expect(Patron.find(id)).to(eq(patron1))
    end
  end

  describe("#delete") do
    it("lets you delete a patron from the database") do
      patron1 = Patron.new({:name => 'Do homework', :checkout_books => 'Finish math and science assignment!', :id => 1})
      patron1.save
      patron2 = Patron.new({:name => 'Mow lawn', :checkout_books => 'Mow the front lawn soon!', :id => 2})
      patron2.save
      patron1.delete()
      expect(Patron.all()).to(eq([patron2]))
    end
  end

  describe("#update") do
    it("lets you update status in the database") do
      patron1 = Patron.new({:name => 'Do homework', :checkout_books => 'Finish math and science assignment!', :id => 1})
      patron1.save
      patron1.update({:name => "Scott"})
      expect(patron1.name()).to(eq("Scott"))
    end
  end

  # describe(".find_by_list") do
  #   it("find a patron based on list id") do
  #     patron1 = Patron.new({:name => 'Do homework', :checkout_books => 'Finish math and science assignment!', :id => nil})
  #     patron1.save
  #     patron2 = Patron.new({:name => 'Mow lawn', :checkout_books => 'Mow the front lawn soon!', :id => nil})
  #     patron2.save
  #     expect(Patron.find_by_list(2)).to(eq([patron2]))
  #   end
  # end
end
