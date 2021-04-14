class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.text :biography
      t.references :user
      t.timestamps
    end
  end
end
