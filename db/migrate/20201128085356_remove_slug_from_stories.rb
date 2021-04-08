class RemoveSlugFromStories < ActiveRecord::Migration[5.2]
  def change
    remove_column :stories, :slug
  end
end
