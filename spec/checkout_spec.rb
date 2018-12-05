require('spec_helper')

describe(Checkout) do
  describe(".all") do
    it("starts off with no lists") do
      expect(Checkout.all()).to(eq([]))
    end
  end

  describe("#patron") do
    it("tells you its patron") do
      list = Checkout.new({:patron => "Epicodus stuff", :book_id => 12, :duedate => '2018-01-01', :id => nil})
      expect(list.patron()).to(eq("Epicodus stuff"))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      list = Checkout.new({:patron => "Epicodus stuff", :book_id => 12, :duedate => '2018-01-01', :id => nil})
      list.save()
      expect(list.id()).to(be_an_instance_of(Integer))
    end
  end

  describe("#save") do
    it("lets you save lists to the database") do
      list = Checkout.new({:patron => "Epicodus stuff", :book_id => 12, :duedate => '2018-01-01', :id => nil})
      list.save()
      expect(Checkout.all()).to(eq([list]))
    end
  end

  describe("#==") do
    it("is the same list if it has the same patron") do
      list1 = Checkout.new({:patron => "Epicodus stuff", :book_id => 12, :duedate => '2018-01-01', :id => nil})
      list2 = Checkout.new({:patron => "Epicodus stuff", :book_id => 12, :duedate => '2018-01-01', :id => nil})
      expect(list1).to(eq(list2))
    end
  end

  describe(".sort") do
    it("will sort the list by patron") do
      list1 = Checkout.new({:patron => "Epicodus stuff", :book_id => 12, :duedate => '2018-01-01', :id => 1})
      list1.save
      list2 = Checkout.new({:patron => "Stephen King", :book_id => 3245, :duedate => '2018-01-01', :id => 2})
      list2.save
      expect(Checkout.sort()).to(eq([list1, list2]))
    end
  end

end
