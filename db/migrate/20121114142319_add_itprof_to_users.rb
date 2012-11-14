class AddItprofToUsers < ActiveRecord::Migration
  def change
    add_column :users, :itprof, :boolean, default: false
  end
end
