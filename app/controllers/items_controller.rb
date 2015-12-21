class ItemsController < ApplicationController
  before_action :find_list

  def create
    @category = Category.find(params[:item][:category_id])
    @item = @list.items.create(item_params)

    if @item.save
      redirect_to list_path(@list, list_id: @list.id, category_id: @category.id)
    else
      redirect_to(:back)
    end
  end

  def destroy
    @item = @list.items.find(params[:id]).destroy
    redirect_to list_path(@item.list, category_id: @item.list.category.id)
  end

  private

    def item_params
      params.require(:item).permit(:content)
    end

    def find_list
      @list = List.find(params[:list_id])
    end
end
