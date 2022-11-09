class RemoveArticleTitleUniqueness < ActiveRecord::Migration[7.0]
  def change
    remove_index :articles, :title
  end
end
