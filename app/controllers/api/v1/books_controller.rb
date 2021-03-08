class Api::V1::BooksController < ApplicationController
  before_action :set_book, only: %i[show update]
  before_action :check_login, only: %i[create]
  before_action :check_owner, only: %i[update destroy show]
  #before_action :check_owner, only: %i[update]
  # ...
  def index
    render json: Book.all
  end

  def create
    book = current_user.books.build(book_params)
    if book.save
      render json: book, status: :created
    else
      render json: { errors: book.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status:
      :unprocessable_entity
    end
  end
  def destroy
    @product.destroy
    head 204
  end
  private
    # ...
  def check_owner

    return head :forbidden if (current_user&.id == nil)
    
    head :forbidden unless @book.user_id == current_user&.id
  end
  def set_book
    @book = Book.find(params[:id])
  end
  def book_params
    params.require(:book).permit(:title)
  end
end