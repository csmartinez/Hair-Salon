require('spec_helper')

describe(Stylist) do
  describe(".all") do
    it("starts off with no stylists") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a stylist by their ID number") do
      test_stylist = Stylist.new({:stylist => "Joan Rivers", :id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:stylist => "Betty White", :id => nil})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

  describe("#stylist") do
    it("tells you the stylist's name") do
      stylist = Stylist.new({:stylist => "Jade Stylist", :id => nil})
      expect(stylist.stylist()).to(eq("Jade Stylist"))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      stylist = Stylist.new({:stylist => "Jade Stylist", :id => nil})
      stylist.save()
      expect(stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("lets your save the stylists into the database") do
      stylist = Stylist.new({:stylist => "Jades Stylist", :id => nil})
      stylist.save()
      expect(Stylist.all()).to(eq([stylist]))
    end
  end

  describe("#==") do
    it("is the same stylist if it has the same name") do
      stylist1 = Stylist.new({:stylist => "Jades Stylist", :id => nil})
      stylist2 = Stylist.new({:stylist => "Jades Stylist", :id => nil})
      expect(stylist1).to(eq(stylist2))
    end
  end

  describe("#clientsname") do
    it("returns an array of clients for that stylist") do
      test_stylist = Stylist.new({:stylist => "Jade Stylist", :id => nil})
      test_stylist.save()
      test_client = Client.new({:clientsname => "Joan Rivers", :stylist_id => test_stylist.id()})
      test_client.save()
      test_client2 = Client.new({:clientsname => "Betty White", :stylist_id => test_stylist.id()})
      test_client2.save()
      expect(test_stylist.clients()).to(eq([test_client, test_client2]))
    end
  end
end
