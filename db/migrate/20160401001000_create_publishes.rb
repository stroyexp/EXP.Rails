class CreatePublishes < ActiveRecord::Migration[5.0]

  def change
    create_table :publishes do |t|
      t.boolean :published, default: false, index: true
      t.date :published_at, index: true

      t.string :header, null: false, index: {unique: true}
      t.text :content
      t.string :partial

      t.string :source

      t.string :title
      t.string :keywords
      t.string :description
      t.string :canonical
      t.string :robots

      t.timestamps
    end
  end

end
