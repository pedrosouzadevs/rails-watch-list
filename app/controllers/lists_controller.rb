class ListsController < ApplicationController
  before_action :set_list, except: %i[index new create]
  def index
    @lists = List.all
    @list = List.new
  end

  def show
    @bookmark = Bookmark.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
