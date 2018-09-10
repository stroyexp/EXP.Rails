class CreatePermits < ActiveRecord::Migration[5.0]

  def change
    create_table :permits do |t|
      t.boolean :published, default: false, index: true

      t.string :name, null: false, index: true
      t.string :number, null: false, index: {unique: true}
      t.string :provider, null: false, index: true
      t.date :issue_at, null: false, index: true
      t.date :onset_at
      t.date :ends_at

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
