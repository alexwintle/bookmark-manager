require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")

      expect(Bookmark.all).to include(
                                "http://www.makersacademy.com",
                                "http://www.destroyallsoftware.com",
                                "http://www.google.com")
    end
  end

  describe '.create' do
    it 'should add a bookmark' do
      Bookmark.create('http://www.amazon.com')

      expect(Bookmark.all).to include("http://www.amazon.com")
    end
  end
end