class AddPriorityToItems < ActiveRecord::Migration
  def change
    add_column :items, :priority, :boolean, default: false
  end
end
