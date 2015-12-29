class CreatePostCategoryJoinTable < ActiveRecord::Migration
  def self.up
    create_table :categories_posts, :id => false do |t|
      t.references :post, index: true
      t.references :category, index: true
    end

    add_foreign_key :categories_posts, :posts
    add_foreign_key :categories_posts, :categories
  end
  def self.down
    drop_table :categories_posts
  end
end

