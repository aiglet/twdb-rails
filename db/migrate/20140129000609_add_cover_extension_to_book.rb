class AddCoverExtensionToBook < ActiveRecord::Migration
  def change
  	add_column :books, :extension, :string
  end
end
