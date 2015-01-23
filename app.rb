require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/stylist')
require('./lib/client')
require('pg')

DB = PG.connect({:dbname => "hairsaloon"})

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
  erb(:stylist)
end

post("/stylists") do
  name = params.fetch("name")
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save()
  @stylists= Stylist.all()
  erb(:index)
end

get("/stylist/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist)
end

#PLEASE READ: This error was given to me, I was unable to see this website in action.
# /Users/carlimartinez/.gem/ruby/2.2.0/gems/pg-0.18.1/lib/pg.rb:45:in `initialize': FATAL:  the database system is shutting down (PG::ConnectionBad)
# 	from /Users/carlimartinez/.gem/ruby/2.2.0/gems/pg-0.18.1/lib/pg.rb:45:in `new'
# 	from /Users/carlimartinez/.gem/ruby/2.2.0/gems/pg-0.18.1/lib/pg.rb:45:in `connect'
# 	from app.rb:8:in `<main>'
#INSTRUCTIONS TO CREATE DATABASE AND TABLES IN README
