class CreateClassics < ActiveRecord::Migration[6.1]
  def change
    create_table :classics do |t|
      t.string :title
      t.text :content
      t.text :translation
      t.references :author
      t.references :category
      t.references :user
      t.timestamps
    end
  end
end
