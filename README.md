# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 2.7.4

* System dependencies

* Configuration
  * Fork and clone this repo
  * install all required gems by running ```bundle install```

* Database creation
  * ![schema](/images/first_schema.png)
    * our database has 4 tables with 2 parent/child relationships as shown

* Database initialization
  after cloning and cd into the directory, run the following
    ```
    rails db:create
   rails db:migrate
   rails db:seed
   ```

* How to run the test suite
  * from the terminal run ```bundle exec rspec ```
