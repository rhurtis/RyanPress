class ArticleValidations < ActiveRecord::Migration[7.0]
  def change
    change_column_null :articles, :title, false
    change_column_null :articles, :body, false
    add_index :articles, :title, :unique => true
  end
end
