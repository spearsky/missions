class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.string :contents
      t.integer :topic_id

      t.timestamps
    end
  end
end
