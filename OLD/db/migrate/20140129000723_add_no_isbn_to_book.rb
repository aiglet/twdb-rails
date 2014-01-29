class AddNoIsbnToBook < ActiveRecord::Migration
  def change
  	add_column :books, :no_ISBN, :boolean
  end
end
