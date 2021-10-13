require 'pg'

class Bookmark
  def self.all
    connection = Bookmark.connect_db

    result = connection.exec("SELECT * FROM bookmarks")
    result.map { |bookmark| bookmark['url'] }
  end

  def self.create(url)
    connection = Bookmark.connect_db

    connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}');")
  end

  private

  def self.connect_db
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'bookmark_manager_test')
    else
      PG.connect(dbname: 'bookmark_manager')
    end
  end
end