class CreateActivities < ActiveRecord::Migration[5.0]

  def change
    create_table :activities do |t|
      t.boolean :published, default: false, index: true
      t.boolean :navigated, default: false, index: true

      t.string :header, null: false, index: true
      t.string :label
      t.text :content, null: false

      t.string :title
      t.string :keywords
      t.string :description
      t.string :canonical
      t.string :robots

      t.integer :index, default: 0, index: true

      t.timestamps
    end
  end

end
