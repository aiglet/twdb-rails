class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :secret
      t.string :email
      t.text :description
      t.date :birthday

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
