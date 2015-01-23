class Client
  attr_reader(:client, :stylist_id)

  define_method(:initialize) do |attributes|
    @client = attributes.fetch(:client)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
      clientsname = clients.fetch("clientsname")
      stylist_id = clients.fetch("saloon_id").to_i()
      clients.push(Clients.new({:clientsname => clientsname, :stylist_id => stylist_id}))
    end
    clients
  end

  define_method(:save) do
    DB.exec("INSERT INTO clients (clientsname, stylist_id) VALUES ('#{@client}', #{@stylist_id})")
  end

  define_method(:==) do |another_client|
    self.clients().==(another_client.clients()).&(self.stylist_id().==(another_stylist.stylist_id()))
  end
end
