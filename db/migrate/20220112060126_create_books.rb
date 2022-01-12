class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.integer :rank
      t.string :title
      t.string :author
      t.text :description

      t.timestamps
    end
  end
end
