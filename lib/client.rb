class Client
  attr_reader(:clientsname, :stylist_id)

  define_method(:initialize) do |attributes|
    @clientsname = attributes.fetch(:clientsname)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
      clientsname = client.fetch("clientsname")
      stylist_id = client.fetch("stylist_id").to_i()
      clients.push(Client.new({:clientsname => clientsname, :stylist_id => stylist_id}))
    end
    clients
  end

  define_method(:save) do
    DB.exec("INSERT INTO clients (clientsname, stylist_id) VALUES ('#{@clientsname}', #{@stylist_id})")
  end

  define_method(:==) do |another_client|
    self.clientsname().==(another_client.clientsname())
  end
end
