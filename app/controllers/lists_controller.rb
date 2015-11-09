class ListsController < ApplicationController
  before_action :find_list, only: [:show, :edit, :update, :destroy]
  before_action :find_category, only: [:new, :edit, :show, :destroy]

  def new
    @list = List.new
  end

  def create
    @category = Category.find(params[:list][:category_id])
    @list = @category.lists.create(list_params)

    if @list.save
      redirect_to list_path(@list, category_id: @category.id)
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def index
    @lists = List.all
  end

  def edit
  end

  def update
    @category = Category.find(params[:list][:category_id])

    if @list.update(list_params)
      redirect_to @category
    else
      render 'edit'
    end
  end

  def destroy
    @list.destroy
    redirect_to category_path(@category)
  end

  private

    def list_params
      params.require(:list).permit(:title, :description)
    end

    def find_list
      @list = List.find(params[:id])
    end

    def find_category
      @category = Category.find_by(id: params[:category_id]) || Category.find_by(id: params[:item][:category])
    end
end
