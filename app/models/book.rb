class Book < ApplicationRecord
     def self.get_data_from_api
        response = RestClient.get("https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=#{ENV['BOOK_KEY']}")
        books_array = JSON.parse(response)["results"]["books"]
        books_array.each do |book|
            self.create(rank: book["rank"] , title: book["title"], author: book["author"], description: book["description"])
        end 
     end
end
