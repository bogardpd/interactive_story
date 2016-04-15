class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :page_num
      t.text :story_text
      t.text :choice_1
      t.text :choice2

      t.timestamps null: false
    end
  end
end
