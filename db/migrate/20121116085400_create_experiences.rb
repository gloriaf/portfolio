class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :name
      t.integer :user_id
      t.string :desc
      t.string :link
      t.string :type
      t.integer :year
      t.string :framework
      t.string :tools
      t.string :info

      t.timestamps
    end
    add_index :experiences, [:user_id, :year]
  end
end
