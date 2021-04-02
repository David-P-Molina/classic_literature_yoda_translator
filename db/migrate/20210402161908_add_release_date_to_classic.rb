class AddReleaseDateToClassic < ActiveRecord::Migration[6.1]
  def change
    add_column :classics, :release_date, :integer
  end
end
