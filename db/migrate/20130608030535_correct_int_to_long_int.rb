class CorrectIntToLongInt < ActiveRecord::Migration
  def up
    change_column :friends, :uid, :integer, :limit => 8
    change_column :users, :uid, :integer, :limit => 8
    add_index :users, :uid
    add_index :friends, :uid
  end

  def down
    remove_index :friends, :column => :uid
    remove_index :users, :column => :uid
    change_column :users, :uid
    change_column :friends, :uid
  end
end
