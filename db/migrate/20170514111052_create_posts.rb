class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :short_desc
      t.text :content
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
