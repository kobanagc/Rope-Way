class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.integer :by_user_id
      t.integer :to_user_id

      t.timestamps
    end
  end
end
