class ListsController < ApplicationController
  before_action :find_list, only: [:show, :edit, :update, :destroy]

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def index
    @cateogories = List.all
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to @list
    else
      render 'edit'
    end
  end

  def destroy
    @list.destroy
    redirect_to root_url
  end

  private

    def list_params
      params.require(:list).permit(:title)
    end

    def find_list
      @list = List.find(params[:id])
    end
end
