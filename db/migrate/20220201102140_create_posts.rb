class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :content
      t.boolean :is_edited

      t.timestamps
    end
  end
end
