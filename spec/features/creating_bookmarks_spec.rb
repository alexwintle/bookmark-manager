feature 'add a bookmark' do
  scenario 'user adds a bookmark and it appears on the index page' do
    visit('/bookmarks/new')

    fill_in('url', with: 'http://www.example.com')
    fill_in('title', with: 'test_bookmark')

    click_button('Submit')

    expect(page).to have_link('test_bookmark', href: 'http://www.example.com')
  end
end
