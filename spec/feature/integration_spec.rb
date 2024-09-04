#location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
    

    scenario 'valid inputs (title)' do
        visit new_book_path
        fill_in "book[title]", with: 'Harry Potter'
        click_on "Add new Book"
        visit books_path
        expect(page).to have_content('Harry Potter')
    end

    
    let!(:book) { Book.create(title: 'Harry Potter')}
    scenario 'valid inputs (author)' do
        visit books_path

        click_link 'Edit'

        fill_in "book[author]", with: 'J. K. Rowling'
        click_on "Edit Book"

        visit books_path
        click_link 'Show'
        # expect(page).to have_content('Harry Potter')
        expect(page).to have_content('J. K. Rowling')
        expect(page).to have_content('Harry Potter')
    end

    scenario 'valid inputs (price)' do
        visit books_path

        click_link 'Edit'

        fill_in "book[price]", with: 9.62
        click_on "Edit Book"

        visit books_path
        click_link 'Show'
        expect(page).to have_content(9.62)
        expect(page).to have_content('Harry Potter')
    end

    scenario 'valid inputs (publish)' do
        visit books_path

        click_link 'Edit'

        select 1997, :from => 'book[publish(1i)]'
        select 'June', :from => 'book[publish(2i)]'
        select 26, :from => 'book[publish(3i)]'

        click_on "Edit Book"

        visit books_path
        click_link 'Show'
        expect(page).to have_content(1997)
        expect(page).to have_content(06)
        expect(page).to have_content(26)

        expect(page).to have_content('Harry Potter')
    end

    # scenario 'valid inputs' do
    #     visit new_book_path
    #     fill_in "book[title]", with: 'Harry Potter'
    #     fill_in "book[publish(1i)]", with: 1997-06-26
    #     fill_in "book[publish(2i)]", with: 1997-06-26
    #     fill_in "book[publish(3i)]", with: 1997-06-26

    #     click_on "Add new Book"
    #     visit books_path
    #     expect(page).to have_content('Harry Potter')
    #     expect(page).to have_content(1997-06-26)
    # end
end