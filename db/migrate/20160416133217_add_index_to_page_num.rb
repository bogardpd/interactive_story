class AddIndexToPageNum < ActiveRecord::Migration
  def change
    add_index :pages, :page_num, unique: true
  end
end
