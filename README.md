# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  ruby "3.1.4"
  Rails "7.1.0"

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite
  rspec file_name_full_path

* Services (job queues, cache servers, search engines, etc.)
  env file with 3rd party api key needed to run in postman
  Weatherapi.com # 3rd party api to get whether json response with param pincode/address.

* Deployment instructions

* ...



#steps followed for assignement

1. creaated weather_datum model to set/store data.
2. created respective controller
   here written a method of my requiremnt to get data. (we get data by city name in india.)pincode param.
3. created service_file: to integrate 3rd party api to our system.
4. we can use redis for cache mechanisam but here used db to store/get data.
5. Next written unit test cases for model and controler.
