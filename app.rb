require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/stylist')
require('./lib/client')
require('pg')

DB = PG.connect({:dbname => "hairsalon"})

get("/") do
  @stylists = Stylist.all()
  erb(:index)
end

post("/clients") do
  clientsname = params.fetch("clientsname")
  stylist_id = params.fetch("stylist_id").to_i()
  client = Client.new({:clientsname => clientsname, :stylist_id => stylist_id})
  client.save()
  @stylist = Stylist.find(stylist_id)
  redirect back
end

post("/stylists") do
  name = params.fetch("name")
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save()
  @stylists= Stylist.all()
  redirect back
end

get("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist)
end
