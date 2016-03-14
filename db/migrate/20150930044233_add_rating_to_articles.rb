class AddRatingToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :rating, :integer, :default => 0
    #change_column_default :articles, :rating, 0
  end
end
