class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :photo_url
      t.string :description
      t.string :resume
      t.timestamps
    end
  end
end
