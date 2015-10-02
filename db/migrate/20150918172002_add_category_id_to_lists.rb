class AddCategoryIdToLists < ActiveRecord::Migration
  def change
    add_reference :lists, :category, index: true, foreign_key: true
  end
end
