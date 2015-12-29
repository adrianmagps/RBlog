class CreatePostTagJoinTable < ActiveRecord::Migration
  def self.up
    create_table :posts_tags, :id => false do |t|
      t.references :post, index: true
      t.references :tag, index: true
    end

    add_foreign_key :posts_tags, :posts
    add_foreign_key :posts_tags, :tags
  end
  def self.down
    drop_table :posts_tags
  end
end
