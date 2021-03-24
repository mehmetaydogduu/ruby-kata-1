require 'csv'

csv_text = File.read(Rails.root.join('db', 'data', 'authors.csv'))
csv = CSV.parse(csv_text, :headers => true, col_sep: ";")
csv.each do |row|
  row = row.to_h
  t = Author.new
  t.email = row['email']
  t.first_name = row['firstname']
  t.last_name = row['lastname']
  t.save
  puts "Author #{t.first_name + ' ' + t.last_name} saved"
end

puts "There are now #{Author.count} rows in the Author table"

csv_text = File.read(Rails.root.join('db', 'data', 'books.csv'))
csv = CSV.parse(csv_text, :headers => true, col_sep: ";")
csv.each do |row|
  row = row.to_h
  t = Book.new
  t.title = row['title']
  t.isbn = row['isbn']
  t.description = row['description']
  t.author = Author.find_by(email: row['authors'])
  t.save
  puts "Book #{t.title} saved"
end

puts "There are now #{Book.count} rows in the Book table"

csv_text = File.read(Rails.root.join('db', 'data', 'magazines.csv'))
csv = CSV.parse(csv_text, :headers => true, col_sep: ";")
csv.each do |row|
  row = row.to_h
  t = Magazine.new
  t.title = row['title']
  t.isbn = row['isbn']
  t.author = Author.find_by(email: row['authors'])
  t.published_at = Date.parse row['publishedAt']
  t.save
  puts "Magazine #{t.title} saved"
end

puts "There are now #{Magazine.count} rows in the Magazine table"

