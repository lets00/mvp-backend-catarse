class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.decimal :goal
      t.string :finnish_date
      t.string :user_id
      t.timestamps
    end
  end
end
