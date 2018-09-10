class CreateTargets < ActiveRecord::Migration[5.0]

  def change
    create_table :targets do |t|
      t.boolean :published, default: false, index: true

      t.integer :important, default: 0, index: true
      t.date :start_at, index: true
      t.date :finish_at

      t.string :name, null: false, index: {unique: true}
      t.text :content

      t.string :address
      t.string :geo
      t.string :website

      t.string :title
      t.string :keywords
      t.string :description
      t.string :canonical
      t.string :robots

      t.integer :index, default: 0, index: true

      t.references :customer, foreign_key: {on_delete: :nullify}

      t.timestamps
    end
  end

end
