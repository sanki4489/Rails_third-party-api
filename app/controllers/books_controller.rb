class BooksController < ApplicationController
    def index
        @books = Book.all
    end
    
    def show
        @books = Book.find_by(id: params[:id])
    end

    def new
        @books = Book.new
    end
    
    def create
        @books = Book.new(book_params)
        if @books.save
            redirect_to root_path, notice: "Book added successfully"
        else
            render :new
        end
    end

    def destroy
        @book = Book.find(params[:id])
        if @book.destroy
            redirect_to root_path, notice: "Book removed sucessfully."
        else
            redirect_to root_path, notice: "Faced issue while deleting."
        end
    end

    private
    def book_params
        params.require(:book).permit(:rank, :title, :author, :description)
    end
end
