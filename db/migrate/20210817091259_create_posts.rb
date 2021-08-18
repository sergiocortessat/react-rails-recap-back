class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :sub
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
  