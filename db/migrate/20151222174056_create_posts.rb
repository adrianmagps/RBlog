class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.boolean :visible
      t.text :summary
      t.integer :visits, default: 0
      t.references :user, index: true

      t.timestamps null: false
    end
  end
  def self.down
    drop_table :posts
  end
end
