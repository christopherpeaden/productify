class ItemsController < ApplicationController
  before_action :find_list
  before_action :find_category

  def create
    @item = @list.items.create(item_params)

    if @item.save
      redirect_to category_list_path(@category, @list)
    else
      redirect_to(:back)
    end
  end

  def destroy
    @item = @list.items.find(params[:id])
    @item.destroy
    redirect_to category_list_path(@category, @list) 
  end

  private

    def item_params
      params.require(:item).permit(:content)
    end

    def find_category
      @category = Category.find(params[:category_id])
    end

    def find_list
      @list = List.find(params[:list_id])
    end
end
