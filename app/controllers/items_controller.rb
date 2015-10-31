class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update, :destroy]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to @item
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def index
    @items = Item.all
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @item
    else
      render 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to root_url
  end

  private

    def item_params
      params.require(:item).permit(:title)
    end

    def find_item
      @item = Item.find(params[:id])
    end
end
