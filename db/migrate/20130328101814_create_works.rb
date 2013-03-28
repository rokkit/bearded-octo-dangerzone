class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.integer :day
      t.float :weight
      t.integer :time
      t.integer :set
      t.references :training

      t.timestamps
    end
    add_index :works, :training_id
  end
end
