class CreateSupports < ActiveRecord::Migration[6.0]
  def change
    create_table :supports do |t|
      t.integer :user_id
      t.integer :project_id
      t.decimal :value
      t.timestamps
    end
  end
end
