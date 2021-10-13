require 'bookmark'

feature 'add a bookmark' do
  scenario 'user adds a bookmark and it appears on the index page' do
    visit('/')

    url = "http://www.amazon.com"

    fill_in('new_bookmark', with: url)
    click_button('Add Bookmark')

    expect(page).to have_content(url)
  end
end