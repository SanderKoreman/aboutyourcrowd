class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def create
  end

  def destroy
  end
end
