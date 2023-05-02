# README

* Ruby version: ruby '2.7.2'

* System dependencies

* Configuration

* Database creation
i. psql -U postgres
ii. create role linkshortener with createdb login password 'password1';

* Database initialization

#### URLs available

1. http://127.0.0.1:3000/
   This is Root path. Enter Original Url

2. http://127.0.0.1:3000/long_to_short_urls/3

3. http://127.0.0.1:3000/long_to_short_urls/3/info
   This will display Url info for eg: original url, visit counts etc
