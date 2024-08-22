class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
  end

  def new
    # here is a get
    @list = List.new
  end

  def create
    # here is a post
    @list = List.new(list_params)
    if @list.save
      redirect_to @list, notice: "New list successfully added!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end
end
