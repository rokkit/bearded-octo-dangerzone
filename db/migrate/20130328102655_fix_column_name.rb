class FixColumnName < ActiveRecord::Migration
  def up
    rename_column :trainings, :type, :gender
  end

  def down
  end
end
