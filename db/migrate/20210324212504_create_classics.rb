class CreateClassics < ActiveRecord::Migration[6.1]
  def change
    create_table :classics do |t|
      t.string :title
      t.text :content
      t.text :translation
      t.references :author
      t.references :category
      t.timestamps
    end
  end
end
