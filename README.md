##Saloon stylists, clients organizer
Stores and lists stylists and clients and directs you to the stylist page with stylist's clients
Ruby version 2.2

##Project Setup

1. psql
psql (9.4.0)
Type "help" for help.

carlimartinez=# CREATE DATABASE hairsalon;

carlimartinez=# \c hairsalon;

hair_saloon=# CREATE TABLE clients (id serial PRIMARY KEY, clientsname varchar, stylist_id);

hair_saloon=# CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);

hair_saloon=# CREATE DATABASE hairsalontest WITH TEMPLATE hairsalon;

2. `gem install bundler`
3.   `bundle`
4.   `ruby app.rb`

4. go to https://localhost:4567 in web browser

##Tests

tests for ruby methods can be run using the rspec gem

`gem install rspec`
`rspec`

##Motivation

To practice creating a Ruby class and methods, SQL practice, attr_reader, and id function which operate on that class. Practicing one-to-many relationships.

##License

MIT License. Copyright 2015. Created by Carli Martinez
