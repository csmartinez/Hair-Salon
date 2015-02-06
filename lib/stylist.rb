class Stylist
  attr_reader(:stylist, :id)

  define_method(:initialize) do |attributes|
    @stylist = attributes.fetch(:stylist)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each() do |mystylist|
      @stylist = mystylist.fetch("stylist")
      @id = mystylist.fetch("id").to_i()
      stylists.push(Stylist.new({:stylist => @stylist, :id => @id}))
    end
    stylists
  end

  define_singleton_method(:find) do |id|
    found_stylist = nil
    Stylist.all().each() do |stylist|
      if stylist.id().==(id)
        found_stylist = stylist
      end
    end
    found_stylist
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (stylist) VALUES ('#{@stylist}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_stylist|
    self.stylist().==(another_stylist.stylist()).&(self.id().==(another_stylist.id()))
  end

  define_method(:clients) do
    list_clients = []
    clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id()};")
    clients.each() do |client|
      clientsname = client.fetch("clientsname")
      stylist_id = client.fetch("stylist_id").to_i()
      list_clients.push(Client.new({:clientsname => clientsname, :stylist_id => stylist_id}))
    end
    list_clients
  end
end
