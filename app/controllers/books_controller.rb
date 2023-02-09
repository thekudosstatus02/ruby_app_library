class BooksController < ApplicationController
    before_action :set_book, only: %i[ show edit update destroy ]

    def index
        @books = Book.all
    end

     # GET /students/new
    def new
        @book = Book.new
    end

    def show
    end

    def create
        @book = Book.new(book_params)
    
        respond_to do |format|
          if @book.save
            format.html { redirect_to book_url(@book), notice: "Book was successfully created." }
            format.json { render :show, status: :created, location: @book }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @book.errors, status: :unprocessable_entity }
          end
        end
      end
    
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:name, :author, :price, :isbn, :year, :publisher)
    end
end
