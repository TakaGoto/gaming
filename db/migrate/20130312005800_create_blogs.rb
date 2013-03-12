class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :summary
      t.text :content
      t.string :user_id
      t.string :banner_image

      t.timestamps
    end
  end
end
