class AddColumnsToStories < ActiveRecord::Migration[5.2]
  def change
    add_column :stories, :likescounter, :integer, default: 0
  end
end
