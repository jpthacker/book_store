# file: app.rb

#require_relative 'lib/database_connection'
require_relative 'lib/book_repository'
require_relative 'lib/book'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('book_store')

# Perform a SQL query on the database and get the result set.
#sql = 'SELECT id, title FROM albums;'
#result = DatabaseConnection.exec_params(sql, [])
repo = BookRepository.new
books = repo.all

# Print out each record from the result set .
books.each do |record|
  puts "#{record.id} - #{record.title} - #{record.author_name}"
end