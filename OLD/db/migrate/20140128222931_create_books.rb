class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.date :pub_date
      t.string :ISBN
      t.text :description

			t.boolean :general_audiences
			t.boolean :teen_up
			t.boolean :mature
			t.boolean :explicit
			t.boolean :graphic_violence
			t.boolean :violence
			t.boolean :major_character_death
			t.boolean :character_death
			t.boolean :sex
			t.boolean :rape
			t.boolean :abuse
			t.boolean :child_abuse

      t.timestamps
    end
  end
end
