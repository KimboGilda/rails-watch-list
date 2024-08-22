class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create]

  def new
    @movies = Movie.all
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = @list.bookmarks.new(bookmark_params)
    if @bookmark.save
      redirect_to @bookmark.list, notice: "Bookmark was added"
    else
      render :new
    end
  end

  def destroy
  end

  private
    def set_list
      @list = List.find(params[:list_id])
    end

    def bookmark_params
        params.require(:bookmark).permit(:movie_id, :comment)
      end
end
