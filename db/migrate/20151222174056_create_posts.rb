class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.boolean :visible
      t.text :summary
      t.string :author

      t.timestamps null: false
    end
  end
end
