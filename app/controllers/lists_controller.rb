class ListsController < ApplicationController
  before_action :set_list, only: %i[show bookmarks]
  def index
    @lists = List.all
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to list_path(@list)
  end

  def bookmarks
    @bookmarks = Bookmark.where(list_id: @list.id)
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
