require('spec_helper')

describe(Author) do
  describe(".all") do
    it("starts off with no lists") do
      expect(Author.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("tells you its name") do
      author = Author.new({:name => "Epicodus stuff", :books => "Funsies", :id => nil})
      expect(author.name()).to(eq("Epicodus stuff"))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      author = Author.new({:name => "Epicodus stuff", :books => "Funsies", :id => nil})
      author.save()
      expect(author.id()).to(be_an_instance_of(Integer))
    end
  end

  describe("#save") do
    it("lets you save authors to the database") do
      author = Author.new({:name => "Epicodus stuff", :books => "Funsies", :id => nil})
      author.save()
      expect(Author.all()).to(eq([author]))
    end
  end

  describe("#==") do
    it("is the same author if it has the same name") do
      author1 = Author.new({:name => "Epicodus stuff", :books => "Funsies", :id => nil})
      author2 = Author.new({:name => "Epicodus stuff", :books => "Funsies", :id => nil})
      expect(author1).to(eq(author2))
    end
  end
end
