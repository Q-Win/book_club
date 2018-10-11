require 'rails_helper'

describe "As a vistitor" do

  before(:each) do

    @user_1 = User.create(name: "John")
    @user_2 = User.create(name: "Jane")
    @user_3 = User.create(name: "David")
    @book_1 = Book.create(title: "Black Beauty", page_count: 255, year_published: 1877)
    @book_2 = Book.create(title: "Babe", page_count: 428, year_published: 1911)
    @book_3 = Book.create(title: "A Game of Thrones", page_count: 811, year_published: 1990)
    @author_1 = Author.create(name: "Martin")
    @author_2 = Author.create(name: "Steve")
    @author_3 = Author.create(name: "Fred")
    @book_author_1 = BookAuthor.create(book_id: @book_1.id, author_id: @author_1.id)
    @book_author_2 = BookAuthor.create(book_id: @book_2.id, author_id: @author_2.id)
    @book_author_3 = BookAuthor.create(book_id: @book_3.id, author_id: @author_3.id)
    @review_1 = @user_1.reviews.create(title: "Flirtation", review: "There are ways.", rating: 5, book_id: @book_2.id)
    @review_2 = @user_1.reviews.create(title: "Your best friend until you find out he’s a drug dealer", review: "The Great Gatsby is your neighbor.", rating: 5, book_id: @book_1.id)
    @review_3 = @user_1.reviews.create(title: "Great story", review: "It is a great story.", rating: 3, book_id: @book_1.id)
    @review_4 = @user_2.reviews.create(title: "Who says psychopaths aren’t romantic?", review: "If I saw you everyday, forever, I would remember this time.", rating: 3, book_id: @book_1.id)
    @review_5 = @user_2.reviews.create(title: "Needs an editor.", review: "David Goodis needs an editor.", rating: 3, book_id: @book_2.id)
    @review_6 = @user_2.reviews.create(title: "A hefty volume", review: "This is a hefty and imposing volume.", rating: 4, book_id: @book_1.id)
    @review_7 = @user_3.reviews.create(title: "Must read", review: "The idea that there exists such thing as a “must read” book.", rating: 5, book_id: @book_3.id)
    @review_8 = @user_3.reviews.create(title: "Expansive", review: "White Teeth is an expansive, detailed, and beautifully written attempt.", rating: 3, book_id: @book_3.id)
  end

  describe "When I visit books show" do

    it 'should see all books' do
      visit "/books/#{@book_1.id}"

      within("#book-header") do
        expect(page).to have_content(@book_1.title)
        expect(page).to have_content(@book_1.average_rating)
      end
    end
  end
end