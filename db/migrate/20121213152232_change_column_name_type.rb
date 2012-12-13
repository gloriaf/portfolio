class ChangeColumnNameType < ActiveRecord::Migration
  def change
    change_table :experiences do |t|
      t.rename :type, :type_experience
    end
  end
end
