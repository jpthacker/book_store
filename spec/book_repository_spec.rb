require 'book_repository'

def reset_books_table
    seed_sql = File.read('spec/seeds_books.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
    connection.exec(seed_sql)
end

RSpec.describe BookRepository do
    before(:each) do 
      reset_books_table
    end
    it 'stores an array of books' do
        repo = BookRepository.new
        books = repo.all

        expect(books.length).to eq 2

        expect(books[0].id).to eq '1'
        expect(books[0].title).to eq 'Mrs Dalloway'
        expect(books[0].author).to eq 'Virginia Woolf'

        expect(books[1].id).to eq '2'
        expect(books[1].title).to eq 'Dracula'
        expect(books[1].author).to eq 'Bram Stoker'
    end
    it 'returns a specific book' do
        repo = BookRepository.new
        book = repo.find(1)

        expect(book.id).to eq '1'
        expect(book.title).to eq 'Mrs Dalloway'
        expect(book.author).to eq 'Virginia Woolf'
    end
end