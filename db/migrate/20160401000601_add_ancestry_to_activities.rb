class AddAncestryToActivities < ActiveRecord::Migration[5.0]

  def change
    change_table :activities do |t|
      t.string :ancestry
      t.index :ancestry
      t.integer :ancestry_depth, default: 0
    end
  end

end
