class ListsController < ApplicationController
  before_action :find_category
  before_action :find_list, except: [:new, :create]

  def new
    @list = List.new
  end

  def create
    @list = @category.lists.create(list_params)

    if @list.save
      redirect_to category_list_path(@category, @list)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
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

    def find_category
      @category = Category.find(params[:category_id])
    end

    def find_list
      @list = List.find(params[:id])
    end
end
