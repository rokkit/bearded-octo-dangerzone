class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.string :name
      t.text :description
      t.float :rating
      t.boolean :type

      t.timestamps
    end
  end
end
