class AddBirthDeathToAuthor < ActiveRecord::Migration[6.1]
  def change
    add_column :authors, :birth, :integer
    add_column :authors, :death, :integer
  end
end
