require 'rspec'
require 'pg'
require 'author'
require 'book'
require 'checkout'
require 'patron'

DB = PG.connect({:dbname => 'library'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM author *;")
    DB.exec("DELETE FROM book *;")
    DB.exec("DELETE FROM checkout *;")
    DB.exec("DELETE FROM patron *;")
  end
end
