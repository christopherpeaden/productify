class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update, :destroy]

  def new
  end

  def create
    @category = Category.find(params[:item][:category_id])
    @list = List.find(params[:list_id])
    @item = @list.items.create(item_params)

    if @item.save
      redirect_to list_path(@list, list_id: @list.id, category_id: @category.id)
    else
      render 'new'
    end
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
    redirect_to list_path(@item.list, category_id: @item.list.category.id)
  end

  private

    def item_params
      params.require(:item).permit(:content)
    end

    def find_item
      @item = Item.find(params[:id])
    end
end
