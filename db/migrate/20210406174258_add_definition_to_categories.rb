class AddDefinitionToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :definition, :string
  end
end
